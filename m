Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAABCE79A9
	for <ath12k@archiver.kernel.org>; Wed, 20 Sep 2023 02:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2InCw2dY82gdThVAOk2aUo2IBbUTZLWt6pgpDYuGQXw=; b=k47dU/Kn424Cdi
	frW2GRnITo3iW9oZlZESN412xCrBRkp4jvfschqVX3yh0JctZiFEnXRifEsuomx0uoA+2RSkAsiSK
	+OG5R63IReWKAzIO9N/+T9KF1yqetOIC9Mms1Ugz2xm7GuqtraYadAXPMq1zHe78SQ9g05MTfF5fq
	IAPErTR52cy+EKIK4KvK5haiji3qEVaUkpX8HABjzqO8c0ix0B0n1v0voukQ1Q407spXeMZTPYy6X
	x9MxSYaTU4JghAXYwkApMZNR/1CnWd8/vbhEKFCTvyStIpVavWzCqvdWaWQV/C56uFiUpeTLVIlJN
	Nymgn5oq2hZFs3SzDptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qimhf-001c2z-2A
	for ath12k@archiver.kernel.org;
	Wed, 20 Sep 2023 02:12:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qimhb-001c2X-2Y
	for ath12k@lists.infradead.org;
	Wed, 20 Sep 2023 02:12:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38K1JKxU006060;
	Wed, 20 Sep 2023 02:12:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=10EeeZpDflKUk7CQvRG7jyrqOr8t7dL3SSXQ+LokSVo=;
 b=gr+tlDDnPj01hMcJmE9KS91PNGJOQzrV58MeMYM6dGb1t2neSMY2+pIJnKQBZuGqO4ZB
 odj7O2F37SfMPO+jgliong2oRVsdMPqEprr6GEC5NdWHtVs5ix/hwpMXmuiT5ZVSkl5L
 RP2MFumcCzM6ymloc53xB0A8vgtUVclWsompXv1CCoNQf/H4fbR+azuNZKSGdfdnIu/o
 rH9ilclJn93z0gOXFmHD0yc6SNmkjoaP4dNXaQpNeTxiI3Rggl6mxcWv4hzoYXM306Db
 Au3UkpU3qzIpI0q2PPa1awc/MgY1JFYvNjPSu/rAEl96b/FFbdW7uWyL6y36EDJZ0Ugr cA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t77wna2eq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 02:12:29 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38K2CSXt016530
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Sep 2023 02:12:29 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Tue, 19 Sep
 2023 19:10:31 -0700
Message-ID: <46b69fe7-d007-18b0-baae-e59ffb035e42@quicinc.com>
Date: Wed, 20 Sep 2023 10:10:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/7] wifi: ath12k: add support to select 6 GHz Regulatory
 type
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Aishwarya R
	<quic_aisr@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230919071724.15505-1-quic_aisr@quicinc.com>
 <20230919071724.15505-2-quic_aisr@quicinc.com>
 <4282f92a-3543-4863-bc00-478ae03759e0@quicinc.com>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <4282f92a-3543-4863-bc00-478ae03759e0@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rY6A1WNRQhVsqUY6oyMPQF9KiZSrUn17
X-Proofpoint-GUID: rY6A1WNRQhVsqUY6oyMPQF9KiZSrUn17
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-20_02,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=783 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309200015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_191231_873781_2D1EC980 
X-CRM114-Status: GOOD (  10.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/20/2023 1:47 AM, Jeff Johnson wrote:
> On 9/19/2023 12:17 AM, Aishwarya R wrote:
>> There are 3 types of regulatory rules for AP mode and 6 types for
>> STATION mode. This is to add wmi_vdev_type and ieee80211_ap_reg_power
>> to select the exact reg rules.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>
> Wen,
> Can you provide a "Tested-on: WCN7850" tag for this series?
>
Jeff, it is this tag below.

I have not tested this serials on WCN7850.

Should I test this serials on WCN7850?

Tested-on: WCN7850 hw2.0 PCI 
WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

[...]


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
