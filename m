Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A475C47258
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9hPzZN+0y+uzqnaHTh/t0oDe9gqc6QWV4gjVQBsXWxY=; b=4SeXiyJXsVmPuXbP6RYz3/Memu
	x96pzaT8YWQzpGcvCqDlBXKxs5PtLt9LAJ/UcpsT+pWsc8jyPAEv82eeGEnw2Ock1k7e53RJX2vKX
	UgOT0GPJ4FcYslRVXtp3kjlrjGLuGTO59mXg/G1ILeR33XTjHQgzf2p6jUB9SMRNkjUPRH5OnQz19
	r7Z7jaiCOp9Bvd/Uf5OL891DbTpPZfJfkRRc37hA40N8pjB6fnK2LyvtfUo0yi+QUz4GrfhCaGbNL
	HRhpnyfNg/7/H12TXIurrkHDNHOS9IEhkWhHLJMEn9pAb2tLgcpmcJtBA5649d/8QnsT8lW2IquW5
	0JuflAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHm5-00000005Qpu-2w8f
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:05:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHm2-00000005Qo1-1VbS
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:05:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VJOgb8011035;
	Wed, 31 Jan 2024 21:05:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9hPzZN+0y+uzqnaHTh/t0oDe9gqc6QWV4gjVQBsXWxY=; b=ef
	uRLwbgR2ObMxdL+mxRha/QmEq/8VGmcp5XDQNtq3qOGQfKdXcCQ7ZTHUvfTPryNE
	LDrx9ArlQy3qnjw+uCoVRUlLsTFyjW4ByYSes5vsZ2yRfugCa6nPdCbCg8pYBoq3
	XvFCodvVgjmhCdTuc9f8dpYzcjY6qHQHo6KND1ifox2RFRgudlWsKijFWwXD1+pa
	KrHFg7m/2gOPfstQkCQ4GXX/CCKpoFmUjHGT0LJI0avqzY+LU5hbR8kBVEyp9Mmh
	S181SRmxnjM1i1lSeLB21cUvvqH4Tld1LRZFC8Rm+f3AKYBURFxgyabJGv7l4mYn
	Z+LJqSMHgn2LO4obylYA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyvb5g722-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:05:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL5UfE031444
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:05:30 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:05:29 -0800
Message-ID: <1374b3a9-bad2-450c-ae13-8082ff6e0cff@quicinc.com>
Date: Wed, 31 Jan 2024 13:05:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/13] wifi: ath12k: add support for peer meta data
 version
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Harshitha Prem <quic_hprem@quicinc.com>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-4-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-4-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GWqHY69vvrdkJX1kve-CMT4HMSgf2XmY
X-Proofpoint-ORIG-GUID: GWqHY69vvrdkJX1kve-CMT4HMSgf2XmY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=899 adultscore=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130534_554969_E5E609F7 
X-CRM114-Status: UNSURE (   8.72  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> From: Harshitha Prem <quic_hprem@quicinc.com>
> 
> Add support to process WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT
> service bit. If this service bit is set by firmware, then it expects
> host to set rx_peer_meta_data_ver in wmi_resource_config's flags2
> with value 3 for QCN9274 to indicate as V1B meta version. If this is
> not set firmware crash is seen during peer addition.
> 
> Hence, if WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT service bit
> is set by firmware, set correct peer metadata version to avoid
> firmware crash.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


