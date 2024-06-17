Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D49C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 21:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QKIwOHoDa+PUmD+eRyKO9EF14yQJfKZDp0ZQumNDjbY=; b=y3NUTvwHAczgkVSu6uRZPpOIgR
	O8dyzL5v16NIQ/0wofAl4OuY1mrTKkkZINz/GKcAQPWiN34v+TWpEZBnwAfCGge/5xS9gPd7K7/a2
	AM+jZ7sT3we2U/incZhDiIG0X5cI+7BBKF8+6SChii88tm3SIMDbxJjZNzTp8IhmgaHVGQaNhLWt1
	cd9WNShtqu6uaX72wZiFj07rmz66AlAzVdlmiDdaGN69elL41lCXU6Q+yP50EzIiutATlT7ip4GEY
	KGAMRt8d/CgvPapa18qtbpIP37khY1WFN/dXBqlSmtHEyzzucyBQ6RSOBLhSlv/F6rU3myBwBP2zJ
	LfF+AuBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJJfs-0000000CeGp-0lYI
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 21:14:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJJfp-0000000CeGN-1au1
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 21:13:58 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HE3kPr030595;
	Mon, 17 Jun 2024 21:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKIwOHoDa+PUmD+eRyKO9EF14yQJfKZDp0ZQumNDjbY=; b=UpQI+OHWslY+1FrV
	n6zvnHEKmKA96lB5SnZ0bM1GEZGrE50o7ONB0S6Rmtr/pVjyo9p+ZcVzLJGn4S7N
	kqKHX7t9nkIVV/PTlIOfVcjLsN8dgws3qhR4woUNoPizRr4zDofeNMmeBR/Z01i7
	wo93za4pbLFs0cgogD/KpIxgbJFNf7fcPwZVcxWvjrdRJyUgWZ+quYcb+VuhYYve
	AmJXsabbCHbm+gquSQP5ZjaSePLrdPtA4enFiAr3ylm0c3fDztkUeLlVy6tHHovg
	Fi6fRpnan/zkQU55z12FWa5yj1q0OZkn2vIVnxJN8nahysCMy2v4zFHznh0rqUuI
	xcBUMg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ytfut2206-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:13:56 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HLDt6a011265
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 21:13:55 GMT
Received: from [10.48.243.231] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 17 Jun
 2024 14:13:55 -0700
Message-ID: <1f760727-6395-40a9-b817-3c05a5760a10@quicinc.com>
Date: Mon, 17 Jun 2024 14:13:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] wifi: ath12k: add factory test mode support
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240617052903.2720292-1-quic_aarasahu@quicinc.com>
 <20240617052903.2720292-4-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240617052903.2720292-4-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: iQWVpRmOgzqw5AHj1rSGbwqjOCNgxkme
X-Proofpoint-GUID: iQWVpRmOgzqw5AHj1rSGbwqjOCNgxkme
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_14,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406170164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_141357_471067_18EC2765 
X-CRM114-Status: GOOD (  17.08  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 6/16/2024 10:29 PM, Aaradhana Sahu wrote:
> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with MISSION mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
> 
> All ath12k test mode interface related commands specified in enum
> ath_tm_cmd.
> 
> When start command ATH_TM_CMD_TESTMODE_START is received, ar state
> is set to test Mode and FTM daemon sends test mode command to wifi
> driver via cfg80211. Wifi driver sends these command to firmware as
> wmi events. If it is segmented commands it will be broken down into
> multiple segments and encoded with TLV header else it is sent to
> firmware as it is.
> 
> Firmware response via UTF events, wifi driver creates skb and send
> to cfg80211, cfg80211 sends firmware response to FTM daemon via
> netlink message.
> 
> Command to boot in ftm mode
> insmod ath12k ftm_mode=1
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
...
>  11 files changed, 560 insertions(+), 8 deletions(-)
>  create mode 100644 drivers/net/wireless/ath/ath12k/testmode.c
...
> +		ftm_cmd->seg_hdr.segmentinfo = le32_encode_bits(num_segments,
> +								ATH12K_FTM_SEGHDR_TOTAL_SEGMENTS) |
> +					       le32_encode_bits(segnumber,
> +								ATH12K_FTM_SEGHDR_CURRENT_SEQ);

ath12k-check warns:
drivers/net/wireless/ath/ath12k/testmode.c:265: line length of 99 exceeds 90 columns
drivers/net/wireless/ath/ath12k/testmode.c:267: line length of 95 exceeds 90 columns

suggest splitting the first line at the =
		ftm_cmd->seg_hdr.segmentinfo =
			le32_encode_bits(num_segments,
					 ATH12K_FTM_SEGHDR_TOTAL_SEGMENTS) |
			le32_encode_bits(segnumber,
					 ATH12K_FTM_SEGHDR_CURRENT_SEQ);


