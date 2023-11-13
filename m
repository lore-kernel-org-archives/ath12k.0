Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C611C4167B
	for <ath12k@archiver.kernel.org>; Mon, 13 Nov 2023 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzHRqwmAH5WILkIoke0Fp0pE2FlqDFP+Gz0GzMeu78U=; b=REITKQ5goercEq
	c+1V00oXIxufQ+SWUA8CuhNvgSjjW7kZ6dXeRoYzUVmLK0qGCGWMUTmaeijKby1iqooOqqLqq6K1b
	erjk9kLZ04PFD+njOXPijvenn79kNM2LSWWE6JBPuJeHwNYwVgMoI2IkwIslwMl5TBDGqAhADAHYA
	R/TM+KNjm552t4p1OhFnXesaLKOzUjyt3aotGxx7PL9IQyMRTBllFT+Xa/F9z5f18D5e0mj6s5HOh
	30MdWCosJpmComtAP/uJginwqKJQml9r9fHQUb0tetX0AuePm5/G9GKKTT71OirajSUjp7wdGXrEe
	8ajfuYkygj8dKi3KGEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YlX-00EEAn-3C
	for ath12k@archiver.kernel.org;
	Mon, 13 Nov 2023 15:22:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2YlU-00EE9l-1D
	for ath12k@lists.infradead.org;
	Mon, 13 Nov 2023 15:22:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADAX0XX023421;
	Mon, 13 Nov 2023 15:22:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WpCBSGdIFSvQcMpQmoVuXPAzmScjNumAyifcGpJeAV8=;
 b=E4bVg2+U/6bEgafdiAbsccwAlkHqNcwoYQe/88o1hyp/7DB1iKOj+OfmFhMLy5JmGEvj
 RGoKIyrzbPTdFz2YzTm1QK0p9rmk17mt5C7eUqvHEr2jysZptG0VLb4DkEhrEfUZnpzq
 4Dvm0wPrUTmzG3pgXdRzo16PwU9mhVfp6TvmuMSnwZVbIz1XWCvqvVGxbldxrWgzNYP1
 BMaW7x0Vf1NjL6OuPS4C5O9kTEBXRHynyvkjAU0U2C9zdLirfCTFoDO+fLB5X14Uvt8N
 xMM6cLxlEzbaMOjRPjT9hCMR1NUk3i33lX5NyPBuS/4UMFVbR6u8rs9n/E6XQ1RmvI3G 7g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u9yanc71b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:22:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ADFMFta019628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Nov 2023 15:22:15 GMT
Received: from [10.110.49.55] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.39; Mon, 13 Nov
 2023 07:22:14 -0800
Message-ID: <ce6a834e-3395-47f5-9b53-45822e0a01c7@quicinc.com>
Date: Mon, 13 Nov 2023 07:22:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: avoid explicit RBM id argument in
 Rxdma replenish
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231111043934.20485-1-quic_periyasa@quicinc.com>
 <20231111043934.20485-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231111043934.20485-3-quic_periyasa@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GKjCzbb_eebyPjkMpaO0aS2Z7kyM0uHP
X-Proofpoint-GUID: GKjCzbb_eebyPjkMpaO0aS2Z7kyM0uHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_06,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=1 bulkscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxscore=1 suspectscore=0 spamscore=1
 lowpriorityscore=0 impostorscore=0 mlxlogscore=202 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_072216_418328_61A27CC1 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/10/2023 8:39 PM, Karthikeyan Periyasamy wrote:
> Currently all Rxdma replenish callers pass the same return
> buffer manager id argument, so make it implicitly. To
> optimize the rx data path per packet, avoid the explicit
> unnecessary argument in Rxdma replenish function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
