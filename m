Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F367C27C4F
	for <ath12k@archiver.kernel.org>; Wed, 26 Jun 2024 18:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lDsWwsdaTUBDqF+6nbEyjVJX2L01zIeks05Bc1Lx3Eo=; b=HcH/dfSS8s4dstiPnQxGBgDs+u
	NGLLApKY1kYEQTRcZnzlU/1ORbT7hrvVAwXAz5xzEXd/q6QPN16ErmchazQ8CW0hTU5R2NBJ4EAZM
	bsldHB8zsWib3HWOIHjbHjlabMLHbNvbQ9epWmxTkA/PuIGq1lf7DBUZpzIc9Og2dZKaYbdJoHlmR
	eOI94Lk2EuzYJxqlel9Qfw4MR7po3DnmvHkOrpT5CnYoZwp/EevpPzuuA1nfvLfJ/mIddGwF+QA2V
	nZKcaKv7Z5uJ6zGKXxyKAZoiSTu/qFs4oHC+RB/btn0Ptqur0bONiRUlFec1+hcE0e0CZrhnZL1p1
	epwMPCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWwu-00000007qR4-2jDc
	for ath12k@archiver.kernel.org;
	Wed, 26 Jun 2024 18:00:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWws-00000007qP8-0ebl
	for ath12k@lists.infradead.org;
	Wed, 26 Jun 2024 18:00:51 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfTYD018092;
	Wed, 26 Jun 2024 18:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lDsWwsdaTUBDqF+6nbEyjVJX2L01zIeks05Bc1Lx3Eo=; b=QCk4SIw1Mo9r/1p+
	nM+0ToMLAoEp3nxPdPFDL0KBA5mfI4OXIuhcFEgvK+8WBzriMhoZ+kVpvlri6MvP
	DyyqazaaMrANC7Vsawr4UfX5ejK35Cy2lrNiPbTRo+RnX+9TYLWzKILvyoPztH/U
	DDFlRcB7eNdFACSWkVTNIhjf8TROyWDSdJQeJ7TdkBNUMqR4FfQZDYat9euhWMOx
	gdUsFOpSfxkgyYkjDVgRZF0vvFMAPDWFddRkh8G9eho/nho5P3Z2f2wgITeJC5/i
	VRa/tepI83h8KhngWNUmqDfyBRevtDxj2feN1PG8EddIfuOVt0X9vdAPdYIMwR+m
	t/h9Vw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywppva1f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 18:00:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QI0lFS028466
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 18:00:47 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 11:00:46 -0700
Message-ID: <65eb0a5e-05cd-4fe4-96e2-1c3b2229ae39@quicinc.com>
Date: Wed, 26 Jun 2024 11:00:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Allow driver initialization for WoW
 unsupported devices
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <stable@vger.kernel.org>
References: <20240626024257.709460-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240626024257.709460-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G_uCpsUHPniOW0tcWLS3o-IcYPyYIyPs
X-Proofpoint-ORIG-GUID: G_uCpsUHPniOW0tcWLS3o-IcYPyYIyPs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_10,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=968 mlxscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_110050_456163_6A9DAA3C 
X-CRM114-Status: GOOD (  16.04  )
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

On 6/25/2024 7:42 PM, Rameshkumar Sundaram wrote:
> Currently during driver initialization, mac registration is allowed
> only for devices that advertise WMI_TLV_SERVICE_WOW, but QCN9274
> doesn't support WoW and hence mac registration is aborted and driver
> is de-initialized.
> 
> Allow mac registration to proceed without WoW Support for devices
> that don't advertise WMI_TLV_SERVICE_WOW.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Cc: stable@vger.kernel.org
> Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/wow.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wow.c b/drivers/net/wireless/ath/ath12k/wow.c
> index 685e8e98d845..c5cba825a84a 100644
> --- a/drivers/net/wireless/ath/ath12k/wow.c
> +++ b/drivers/net/wireless/ath/ath12k/wow.c
> @@ -1001,8 +1001,8 @@ int ath12k_wow_op_resume(struct ieee80211_hw *hw)
>  
>  int ath12k_wow_init(struct ath12k *ar)
>  {
> -	if (WARN_ON(!test_bit(WMI_TLV_SERVICE_WOW, ar->wmi->wmi_ab->svc_map)))
> -		return -EINVAL;
> +	if (!test_bit(WMI_TLV_SERVICE_WOW, ar->wmi->wmi_ab->svc_map))
> +		return 0;
>  
>  	ar->wow.wowlan_support = ath12k_wowlan_support;
>  
> 
> base-commit: dadc1101eabb54ace51aa6fc58c902bf43ac0ed7
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


