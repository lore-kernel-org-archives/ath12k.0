Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607B1C36002
	for <ath12k@archiver.kernel.org>; Wed,  9 Apr 2025 06:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/Rtdw729DrYsVcMcBJ5bS0z0LMNSPt1aCCP1Q8gcBA=; b=Y/rXLARHpyyAaOZJJB0JfppGbc
	cPhtDZqjhZ9U4Jc+UiWoZOYnk0yGf00k7n9jj5QWtjKzXDwbhv+0KdcEKEAGRymBfYe1mzz4G3IPo
	RM19+CMRF8WHPptq+70ehq5z0S3ouotyBdCEn6NV2y5Cy+W835hG1FVbyeiHaCfzZ+CG/rtMBFHyF
	G8s3lqtVid3VDzXEq+Li6fnaJ1t04AiVHztE1VXI9Q9ues0nhP+6WxCaNgtKiX5f7CO0pML6iakKj
	it5alOyVWvNGxPCwdJVztoUFc4yBTsmY5tEc0C0c+4I+TV8tfoc3K57VQAimLlY5SdSEtQ3iE3Rfv
	B+YZ2hXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PGg-00000006KOI-0gkr
	for ath12k@archiver.kernel.org;
	Wed, 09 Apr 2025 06:50:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2PCY-00000006Jmy-19JY
	for ath12k@lists.infradead.org;
	Wed, 09 Apr 2025 06:46:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538JZ2R8006892;
	Wed, 9 Apr 2025 06:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u/Rtdw729DrYsVcMcBJ5bS0z0LMNSPt1aCCP1Q8gcBA=; b=TvlSmvmCX0nS0u7x
	JLjeHlagfJrlgqSYUx846bf8b0NIKpBtdyP63RawepFi1g0Hz5S4qtHjko+gmJKW
	NszyyHxOlX8VFeusLqxC1bguf65MK4Ry8E6dN2pSStcolRzJb/qx6990wMrZ+Dn5
	jvfbhbk9TaY8SGwaD/49nP1Jcq4Onae08+sd4FR9TITEnoJ1ePYyYfRqSnYDzdCS
	96Y0Jve/t4ERmuiP/XLrwdJgT0BioXifmBU7Or/N8kdpY+A3M2JLgn7ED8fyasmN
	iOPyeRcrZIF3267YDFIvHOFFDMoYsYXh6OBC1/ZXYPkC96DIYtfD6IMPD//krqXJ
	RbPruQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3ja92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Apr 2025 06:46:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5396kKjq002640
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 9 Apr 2025 06:46:20 GMT
Received: from [10.216.15.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 8 Apr 2025
 23:46:18 -0700
Message-ID: <cb37ecfe-c737-de97-0729-af2c87062058@quicinc.com>
Date: Wed, 9 Apr 2025 12:16:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 1/2] wifi: ath12k: using msdu end descriptor to
 check for rx multicast packets
Content-Language: en-US
To: Sarika Sharma <quic_sarishar@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20250408130132.2919329-1-quic_sarishar@quicinc.com>
 <20250408130132.2919329-2-quic_sarishar@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20250408130132.2919329-2-quic_sarishar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vOPB5BQOJv4ux141sfRx5uVvHB8Z3BlG
X-Proofpoint-ORIG-GUID: vOPB5BQOJv4ux141sfRx5uVvHB8Z3BlG
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f617bd cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=PuXzj55vBIrZp1NSK-YA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_02,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=894 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_234622_432220_1CE40AA0 
X-CRM114-Status: GOOD (  15.23  )
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



On 4/8/2025 6:31 PM, Sarika Sharma wrote:
> Currently, the RX multicast broadcast packet check is performed using
> bit 15 from the info6 field of the MPDU start descriptor. This check
> can also be done using bit 9 from the info5 field of the MSDU end
> descriptor. However, in some scenarios multicast bit is not set when
> fetched from MPDU start descriptor.
> Therefore, checking the RX multicast broadcast packet from the MSDU
> end descriptor is more reliable as it is per MSDU.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/hal.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
> index d00869a33fea..d961392bb981 100644
> --- a/drivers/net/wireless/ath/ath12k/hal.c
> +++ b/drivers/net/wireless/ath/ath12k/hal.c
> @@ -449,8 +449,8 @@ static u8 *ath12k_hw_qcn9274_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
>   
>   static bool ath12k_hw_qcn9274_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
>   {
> -	return __le32_to_cpu(desc->u.qcn9274.mpdu_start.info6) &
> -	       RX_MPDU_START_INFO6_MCAST_BCAST;
> +	return __le16_to_cpu(desc->u.qcn9274.msdu_end.info5) &
> +	       RX_MSDU_END_INFO5_DA_IS_MCBC;
>   }
>   
>   static void ath12k_hw_qcn9274_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,
> @@ -902,8 +902,8 @@ static u8 *ath12k_hw_qcn9274_compact_rx_desc_mpdu_start_addr2(struct hal_rx_desc
>   
>   static bool ath12k_hw_qcn9274_compact_rx_desc_is_da_mcbc(struct hal_rx_desc *desc)
>   {
> -	return __le32_to_cpu(desc->u.qcn9274_compact.mpdu_start.info6) &
> -	       RX_MPDU_START_INFO6_MCAST_BCAST;
> +	return __le32_to_cpu(desc->u.qcn9274_compact.msdu_end.info5) &
> +	       RX_MSDU_END_INFO5_DA_IS_MCBC;

hal.c:905:16: warning: cast to restricted __le32
hal.c:905:16: warning: cast from restricted __le16

Pls address the above warning.

Vasanth

