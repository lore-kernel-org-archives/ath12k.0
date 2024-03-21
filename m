Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC666CD11BF
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 20:26:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB9Tp9jC2IE3scsHRqJVGjwcJipZ4G1OwxZ4knrp4s0=; b=T+hsFFE63MIKjnIOAnBtuE5K8y
	yYVTmKTi4D4CrN8zdjbbed89G2P0qA5vDIrSxQMfrzQNuKU5seRY81ANhocyL1+q6yel7wsxWTJJi
	TfijEh0D5yDpAN4vTsEo6HV4CccCHG/OQdJmWjLZNkyxcYSWh44xEidmtFOyP05wElQ/bkHJHrPqB
	8fgUA0CU+sHbB33aZU/zF+7ju1hPysA2gxmnjNgTGp4F/dU4RI958sDb0xCgaNRDyiAHGfrRZSYKX
	qOQpfmXHvOABKLvxG67UD1gKZqJK4wdYecdPxDVVgqZBDgoaJW2a/7FtpnBMyD56+V3WtTaTL3Yb2
	VdScNBew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnP07-00000004WRC-1h1O
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 20:26:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnP02-00000004WOu-2BoA;
	Thu, 21 Mar 2024 20:26:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42LJq38p017590;
	Thu, 21 Mar 2024 20:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=zB9Tp9jC2IE3scsHRqJVGjwcJipZ4G1OwxZ4knrp4s0=; b=SB
	KZ1wTV3VeJQAiRC+x9tPb7KSm1PncOY67y2TKDGSWve++sZWpjZw215wZqXKJGxE
	IND36+DKB+oHGMpt6vC/LotrdnzuDCw88TOR9TE+mqSRiSIX9PnL5dohbiiqYgAN
	sSJAaOSNw85j5d1lOnMqRbZYONbB19k2LDSHvdl3U8mm+JMUAXLxSbvkpBQW4j9b
	sDdSP2SJikYOyds9TGIczJSCdkwj4+MjEP4gTOXAI2kf9AWbXDGYRwfwaMiFwY4r
	Y1v9jdGyLF/6E7jYJem+0FFuSHEEfkfH+0BOYRI2MzMCp+T/I4LpEsVChrFbrYYp
	P2FyfSN3mD3clJI4/gqw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0ue601w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:26:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42LKQpdW017863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Mar 2024 20:26:51 GMT
Received: from [10.110.74.135] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 13:26:51 -0700
Message-ID: <8f477028-1411-443a-8c0b-351ed0186bb1@quicinc.com>
Date: Thu, 21 Mar 2024 13:26:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: cfg80211/mac80211: Add support to rx retry
 stats
Content-Language: en-US
To: Hari Chandrakanthan <quic_haric@quicinc.com>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240319134522.4021062-1-quic_haric@quicinc.com>
 <20240319134522.4021062-2-quic_haric@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240319134522.4021062-2-quic_haric@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Idceh1EhwyJK8eddX36HbBDNXB3ITmsh
X-Proofpoint-GUID: Idceh1EhwyJK8eddX36HbBDNXB3ITmsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=873
 spamscore=0 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403210152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_132654_734039_A978627A 
X-CRM114-Status: UNSURE (   7.98  )
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

On 3/19/2024 6:45 AM, Hari Chandrakanthan wrote:
> Add support to count station level rx retries.
> It denotes the number of data frames(MPDUs) with rx retry bit set.
> 
> The rx retry stats helps in understanding the medium
> during UL transmission.
> 
> The counting logic of rx retry stats in the mac80211 rx path accounts the
> data frames for which decap is not offloaded.
> 
> Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>

Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>


