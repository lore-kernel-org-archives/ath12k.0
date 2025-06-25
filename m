Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076FBC77B7C
	for <ath12k@archiver.kernel.org>; Wed, 25 Jun 2025 01:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcIRdC0ggL2+IzhQozZShGTOy+MPRgfU0woMX8YlWZ4=; b=hn+o1xCtQSgbNGeeqWqPKS2JZ8
	xD31XiaHtqwt/23RePhDygO6N7mxtGwk9YF8BlKYo/w+IZbBjPcKj3INH+8RsGaOBRaPl80HUTPVE
	6MN/khxktB6MRb0meq+XT7MEWFmsuM/a5iOaQ4l5eY4NI0ftNB6iuHYnw9Hc5xp70nfCF0Mii8s3z
	WXbnOpt7pD3EEBlEDUwVxOtgOOXK2/8gGfaFvXWPTLhIZstRSvZr8ZwYur77QTXz0vxyu18xpvZKz
	hy3ECd3d/UiuDKEB1UBljDmpCj7fm4fngAWPnXSDp7m1pF+Q1kxLGU4yuEQozcO4v89VFikixwKbZ
	9agdeb2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFLI-00000007I4Y-2szn;
	Wed, 25 Jun 2025 01:54:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUFKn-00000007I0H-0ha1
	for ath12k@lists.infradead.org;
	Wed, 25 Jun 2025 01:53:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OFhLV1021010;
	Wed, 25 Jun 2025 01:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KcIRdC0ggL2+IzhQozZShGTOy+MPRgfU0woMX8YlWZ4=; b=NnaWeI6ZhIjDiNzR
	eeqeUszQvET8taB6qVSefAL3shzjOHjL1xpKlTeSYdillU3brmS/u+4yM367abRR
	Pv3DE0CEjkLsXixnlHmMOvizET1yRW8igaROTTvSgPRCf4AhzuDbWdoasFxsjhfF
	ENx20peyT8b8elmxxFjWUVqJjFDi73VtCclVnnEngTSCAGMMTTsauGbaeDmO2KGp
	AjcDvE0/zXw13YQBqFIBpEc7NYIQqHV3V+ZECPl2MCMjwinUXfW7XW2JGiOL7CRB
	27JGG5LmJM2F1niXBHPhJuxM/bbK+KwHj+bkuH85a1qxYJNa+WiSRk4atU0T0In6
	KZjKRA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfwvcsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 01:53:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55P1rqfb005547
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 01:53:53 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 24 Jun
 2025 18:53:51 -0700
Message-ID: <4503f964-f2e1-42ff-a263-613f340f9a7c@quicinc.com>
Date: Wed, 25 Jun 2025 09:53:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] wifi: ath12k: use plain access for descriptor
 length
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
CC: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Remi Pommarel
	<repk@triplefau.lt>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20250617084402.14475-1-johan+linaro@kernel.org>
 <20250617084402.14475-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250617084402.14475-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wsb-wvDVf5_SKpyghEr1H0CKDFB8wp2i
X-Proofpoint-ORIG-GUID: wsb-wvDVf5_SKpyghEr1H0CKDFB8wp2i
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685b56b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=DtruAg4B5Pfe8s7-AC8A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAxMyBTYWx0ZWRfX5d1Vmo8kkxcT
 bmw7Z02yB03Ri7b0p55cY4ptYMlQzyZhP452M+XwN61QJYGFkfqxEI0fNCFgx7PUDMv39TWiSTO
 RSKfnJ1VOel7uoy7ZXOsiuN0tc69EHYzYIva5kVY6T1oPf/EwpkYpZTIm+FxOG0hn6UzIi1nGeT
 8gR5+4vNrO75FUr8JaVP47CJJZS+hAk241+8CYQZFJtaIvvum0dKRLGm2MG1Erc++i4k+z9tZ01
 cQXdChgQR1u5Jagx2QxelFdoYiW5nDwgyHOAK0j33JGqhToojrpQix3dJR3Kf1S/WwFjRoqMctv
 5eqrJhk+PBstTnAWF1RRWXUUTHQyZcqpF4lPc1n9FH92DtAMBM3wHjh+uXAMPXOh44Nra0/c92k
 8/0A8fLuSqtyKEOB4TEbAF3ObnkryJ5mVd56FTGUr+dBzxxAQbqjPRieBQoqEnDRkT2NkL7B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=735 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_185357_325584_9BFA871F 
X-CRM114-Status: GOOD (  13.41  )
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



On 6/17/2025 4:44 PM, Johan Hovold wrote:
> The read memory barrier added by commit 6b67d2cf14ea ("wifi: ath12k: fix
> ring-buffer corruption") is enough to guarantee ordering also for plain
> descriptor accesses if the length helper is ever inlined so drop the
> unnecessary READ_ONCE().
> 
> Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/net/wireless/ath/ath12k/hal.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index f8bd3837b9dc..726969cfcaec 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -1950,7 +1950,7 @@ u32 ath12k_hal_ce_dst_status_get_length(struct hal_ce_srng_dst_status_desc *desc
>  {
>  	u32 len;
>  
> -	len = le32_get_bits(READ_ONCE(desc->flags), HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
> +	len = le32_get_bits(desc->flags, HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
>  	desc->flags &= ~cpu_to_le32(HAL_CE_DST_STATUS_DESC_FLAGS_LEN);
>  
>  	return len;


Reviewed-by: Baochen Qiang <quic_bqiang@quicinc.com>



