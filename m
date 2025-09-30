Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BB9CCCA471
	for <ath12k@archiver.kernel.org>; Tue, 30 Sep 2025 13:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IlUwWJDfckEuvqk5pG1t9MrAPhZFXCfatpDAZlAI/LQ=; b=QKg1OrjWyO35hHq/IilvMIDzcf
	apxdHs6xqOcTDjdjjlN7x9mGMtLiEc//NVeFjoTDBeVZHySXCs8hvbGk5vUcc52o33x+ymvK7dhs5
	ofkQs5WzBdLPeWdOvX2Pzmy9mQTpv5NBnRf5qoeB6BQSa1mig2s5X2mEErsY+SjZy5mQ8CFm70rNz
	luOgugMD+9xL6m4t6/6jEMyPsThpPCRoiCwvG9WSv9exkmGVV6+j/C+8K3JpyWFYNkSWVgLpb1jWh
	Zvp3bGXjVxCjbPkywlFBAXqh427zSRQKfi/JPx9nQ3auDIQLDri9qq5LrxkWyI90FZEh4EFJapFIu
	iHOBdzgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a9h-00000005Mhr-1K4T;
	Tue, 30 Sep 2025 13:12:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3a9e-00000005Mgk-26eL
	for ath12k@lists.infradead.org;
	Tue, 30 Sep 2025 13:12:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58UBnM3u014639;
	Tue, 30 Sep 2025 13:12:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IlUwWJDfckEuvqk5pG1t9MrAPhZFXCfatpDAZlAI/LQ=; b=omkCt99WVciRehG8
	BDg7DPZ4oKFYzv4HqwLSQfGMXfDlihDScOFtuEb5FL5WxqVKU35fkIhveo4ZfqCM
	h1r/NFH83jeLyuYjhfRm/bPrd+PHdbeojI6Ygaq8km6Ou4gs1vRnHDJqobm3Vk7k
	Z1hzuAIBQZ+vRYxQEl88+vtLCMZMGWCDlpHalZQrySiNJT6QbK0dZK4jjG4BoyWk
	oTotXPZ/3+CCeJW5Qj176kkwzVlIi/wkA4PHCKCd8rn/ZTfSD5pN2BPS7imSd57f
	Dh5FQlErBdhFtWGNyC7v7o3sxBLqa5H5JPxOYWO1PM1K66x1Qlm23LogroHOZrlC
	0GOUxw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vr110e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 13:12:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58UDCTX5005510
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Sep 2025 13:12:29 GMT
Received: from [10.79.124.128] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Tue, 30 Sep
 2025 06:12:28 -0700
Message-ID: <4b530795-3508-4179-b33c-05e58869ca09@quicinc.com>
Date: Tue, 30 Sep 2025 18:42:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath12k-ng v3 6/6] wifi: ath12k: Refactor ath12k_vif
 structure
Content-Language: en-GB
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250929115102.512719-1-quic_rdeuri@quicinc.com>
 <20250929115102.512719-7-quic_rdeuri@quicinc.com>
 <39facf12-c452-4fa4-9b76-3da6a0ce3230@oss.qualcomm.com>
From: Ripan Deuri <quic_rdeuri@quicinc.com>
In-Reply-To: <39facf12-c452-4fa4-9b76-3da6a0ce3230@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FnNrCSqTg4Foq0c0V385hU1VnigS-eja
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfX3kkhi4jDaHcy
 xmyy/edD2Oxw4+p29wqdB/8XmPC7l4NV/zlrNkOqup1kyKClYAXWW5EV3bRDbDx8Dw3sJ15PFnS
 h5bTU0l9qoCQF1lAL8ilz44uaRg8M1iTwEC1zPIyBOTMJAA14Z0hGRshsoNr/hL7ykCyuTLKGeo
 C0sidJPDy/J9jRkYII/XXbMH2xJHhXZMm5wd6uoZQkTGGlDBMHj6kKpBbON2HCoEJqN4OimVUnJ
 f7Gb2+HgYkmg2SXYcMFtLgGP6M19j57+qdXq92vUBC8JbgafFJmfLFVWRWbsA3RXX7+UTfw6WYG
 U5dOamm7AeIdVCL5aTNXX7+K0cpDgAS5HEZyFbVdifDOdpG2/ZfRYY2n7jldenBHcn0QZP4zLnM
 s7vNbEb3fgO03gA4rM+Z2ZLlz+2u5w==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68dbd73e cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10
 a=4MtMu4i2hCYbHh_dtokA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: FnNrCSqTg4Foq0c0V385hU1VnigS-eja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_061230_552736_822A1945 
X-CRM114-Status: UNSURE (   9.50  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 9/30/2025 9:00 AM, Baochen Qiang wrote:
> 
> 
> On 9/29/2025 7:51 PM, Ripan Deuri wrote:
> 
>> @@ -938,15 +944,19 @@ int ath12k_dp_pdev_alloc(struct ath12k_base *ab)
>>  
>>  static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
>>  {
>> +	u8 link_id = arvif->link_id;
>> +	struct ath12k_vif *ahvif = arvif->ahvif;
>> +	struct ath12k_dp_link_vif *dp_link_vif = &ahvif->dp_vif.dp_link_vif[link_id];
> 
> nit: consistently use ath12k_dp_vif_to_dp_link_vif()

Addressed in v4.

>> +
>>  	switch (arvif->ahvif->vdev_type) {
>>  	case WMI_VDEV_TYPE_STA:
>> -		arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
>> -		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
>> +		dp_link_vif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
>> +		dp_link_vif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
>>  		break;
>>  	case WMI_VDEV_TYPE_AP:
>>  	case WMI_VDEV_TYPE_IBSS:
>> -		arvif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
>> -		arvif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
>> +		dp_link_vif->hal_addr_search_flags = HAL_TX_ADDRX_EN;
>> +		dp_link_vif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
>>  		break;
>>  	case WMI_VDEV_TYPE_MONITOR:
>>  	default:
> 
> [...]
> 
>> @@ -318,12 +318,14 @@ int ath12k_peer_create(struct ath12k *ar, struct ath12k_link_vif *arvif,
>>  		       struct ath12k_wmi_peer_create_arg *arg)
>>  {
>>  	struct ieee80211_vif *vif = ath12k_ahvif_to_vif(arvif->ahvif);
>> +	struct ath12k_vif *ahvif = arvif->ahvif;
>>  	struct ath12k_link_sta *arsta;
>>  	u8 link_id = arvif->link_id;
>>  	struct ath12k_peer *peer;
>>  	struct ath12k_sta *ahsta;
>>  	u16 ml_peer_id;
>>  	int ret;
>> +	struct ath12k_dp_link_vif *dp_link_vif = &ahvif->dp_vif.dp_link_vif[link_id];
> 
> same here, use ath12k_dp_vif_to_dp_link_vif()

Addressed in v4.


