Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 716D7C02185
	for <ath12k@archiver.kernel.org>; Mon, 20 Jan 2025 04:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PSOgj5cwjNHbnMBRRbTxTJDl8EcqNL8S/4PwfM6Drqs=; b=SaiigyVKguLMzjzNyESrZsJ8td
	SB3jxxkJBSPOb16mi/ihy7Aa+nSKNJ+pjK5KDuz+tZbwKQXHmCHaR3J5RjCQ+EZJjBsmYPvEnAL5V
	En+tqnA/bR7ngGJEao62IDRKmGW9ISFaIZuMbsXUMwXOEjVrYEtUVD8pHw/fTVOft1pia0zFJruPU
	uO/X1Z12JKLCGKvmXZdyUtuxBx4kJRkuqD5rPMRIA3eCA3c7Lwg5NtWaHED/pq7i1+Ivnbg2/qaOA
	9EwusvgXC+x/Sxfr1B6luMNYm6Kp3Zx8AjOBVxjwBlSUinMAfwDLLY3r3bwmlXitEIHz5AfNz3yvv
	u8dB7q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZj6R-00000004gvE-0rYP
	for ath12k@archiver.kernel.org;
	Mon, 20 Jan 2025 04:09:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZj6O-00000004gul-1eOC
	for ath12k@lists.infradead.org;
	Mon, 20 Jan 2025 04:09:29 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50JMt2LF007222;
	Mon, 20 Jan 2025 04:09:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PSOgj5cwjNHbnMBRRbTxTJDl8EcqNL8S/4PwfM6Drqs=; b=JQYV9EhkQsU7EWxZ
	96Cjj/pKK3/oqO7Pz4qCh3j4LxXHQ5NwYL6Mt86MMQg9l0b0pMASFJ2XgJduzVmm
	Zen5OLEq+QWErFOvqTJ7RodqpU4yaxla60f3AzYbrjkIK1vec94+Q55PKtf6rROv
	q1+SuGnXVZEydSq/sYYOxsKxSHa3QRpcmHlBRNoiqSMPmZybE63R4MAm3ZaKFJzU
	tdBve9AF1gY4cfYksoCJL5OInisVZe8EGWHBey5EYUDnxet0RqhsCTbnMMwlEtAj
	k1KN/q0K2JSaN5LE2gPxxwykJJuYmK9P6OyeDL30N5Gh+VNG+EFq/CylVf2l7zrG
	Se2lsA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44852d2xvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:09:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50K49RII005184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 04:09:27 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 19 Jan
 2025 20:09:26 -0800
Message-ID: <469dde6c-3eea-4117-84bd-93fe63d50c8c@quicinc.com>
Date: Mon, 20 Jan 2025 09:39:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/4] wifi: ath12k: add factory test mode support
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250119083657.1937557-1-quic_aarasahu@quicinc.com>
 <20250119083657.1937557-4-quic_aarasahu@quicinc.com>
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250119083657.1937557-4-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9s8dHI69i0GQhMrdjYIHeI10ltX4KBOc
X-Proofpoint-GUID: 9s8dHI69i0GQhMrdjYIHeI10ltX4KBOc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_01,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501200030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_200928_438067_8B51DC83 
X-CRM114-Status: GOOD (  13.80  )
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

On 1/19/25 14:06, Aaradhana Sahu wrote:
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
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu<quic_aarasahu@quicinc.com>
> ---

Reviewed-by: Aditya Kumar Singh <quic_adisi@quicinc.com>


-- 
Aditya

