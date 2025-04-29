Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24B19C369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 04:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQiDQ3Wj8f6Mkhdu1WsvHm9cqL93mewNDdZuDN5leQM=; b=LIWTu+R50jA+YPF8d4ayMAukaQ
	vvX53iDGhMxOODX2W15gaKmXXtwHra2PbSqR06nb2FRe2ZfeT2nJZuTPwe/RC7JiJvC7lICIGpZi+
	H/DyHwyjBr++jzUqX5R8k3ufOW6MYaQDF6o2Ja6CGvmK/ku1PY/f066WqMNLnDWvYX+ufLa5+YUJq
	WyBpWhr+4b4LiYFV5k6RElDWeW9+va9uhZ1hOtlZJQHNvQ2Egitl5ygzlTlGoNw3WAUyBdVmad06j
	NZLIrwdk7w6YLpr0ieEUOtoquZhVyg+naSkmDR7fd/rRdcJ0dAJiBD7WcZ0FG7DkAGnyvceqG0xNR
	XbrXPaLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9coz-00000008K8p-3l44;
	Tue, 29 Apr 2025 04:43:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cox-00000008K8H-2sqM
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 04:43:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3pL012818;
	Tue, 29 Apr 2025 04:43:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQiDQ3Wj8f6Mkhdu1WsvHm9cqL93mewNDdZuDN5leQM=; b=StuKZdx+BYJER9V2
	mbzPDflxkWkmGYl/NecbleMxg66jgbj6wxLd7qby5vCwcqQe9DyD7/hZlpuZItwu
	GPsdl9LVV4pgccNRhuicRGuu6+x7oZo7bwJvUfZhwbgEDbekd6hqrlQoBGTyrNUL
	1L5Ne4187FaqCK7wZ7sOuWH71wljwNTDLgwVeF+MEn+UxLKQBETOykOj5cRH8+2H
	N2dSuXi5ms9SlrJpwBZ5tB14Ew20nyT9Hum14YuyadEtNGiHzpsLLsgYCVKzF4Ix
	mfSihav+E12wENBfFOm6Teb6hCf4v7HY9fa86L6yFKE7wg+YIml0JVzMaHFaxK7m
	UC3kLA==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn25fs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:43:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T4hoR8024651
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:43:50 GMT
Received: from [10.216.24.29] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 21:43:48 -0700
Message-ID: <dac71b79-bf6d-4a2a-9c7c-31c52874fcb6@quicinc.com>
Date: Tue, 29 Apr 2025 10:13:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Enable AST index based address
 search in Station Mode
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
References: <20250422094255.131226-1-nithyanantham.paramasivam@oss.qualcomm.com>
From: Mahendran P <quic_mahep@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250422094255.131226-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1vzTER77Z6nsFR1Y-9gs3MltlFiYvqEd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMyBTYWx0ZWRfX9kpX3/K56v1Q ZZz92+kvgJkg+TwJMFgtIadbkbNAXp2EECaI+t9AeHkeqaaXNOuHGAZjPCyVC8hKj1YOQ8A6dsT HmYi8imBIArGCEx1aKuoCBQZ7D9nLkCZFmMKUhzzjkyJzCJlaTN4DDwDQEi/AA0UJxRIs3ajiPk
 QFTl/SALjo6FFfk5+7sOrs5UorJB7XAYA3eLCEAbTM+QzP36JjjDQfHwlTLajYBSnfPh40WoVNj oJVkO1AOwCnOh/IcejdgpkcA+BBotTmiyto04iMrYaccyeZOi6Xjp6RrlbywDjzDxLJX28/1iCw zFJxUkz5TeOx5tGcrtkb/Vj6OzptRc6BCeJqL5LiBch82Ef4ub9LZPLXWQ0d+HpbHM61HqBpWUp
 gi3azFAtPHZzTn/kWI0UYo7NNOJjGcsQO4ndKk4ZczGebroRbDaTyohDpA1O1F97UvVYW6E/
X-Proofpoint-GUID: 1vzTER77Z6nsFR1Y-9gs3MltlFiYvqEd
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=68105906 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=l_I2kL9VWpTzgr9iVmoA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_214351_741969_8D8F6FAE 
X-CRM114-Status: GOOD (  16.92  )
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

On 4/22/2025 3:12 PM, Nithyanantham Paramasivam wrote:
> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> 
> Currently, TCL performs the TX address search for each entry during
> transmission, which may lead to packet delays.
> 
> To mitigate this issue, enable AST index-based address search during
> transmission in station mode. This AST index-based search is not
> enabled in AP mode due to the complexity involved in fetching peer
> information.
> 
> Implement changes to retrieve the offset of ast_idx/ast_hash values
> from the PEER_MAP3 event, update the vdev search type to ADDRX, and
> enable AST lookup in the bank configuration.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c    | 10 +++++-----
>  drivers/net/wireless/ath/ath12k/dp.h    |  2 ++
>  drivers/net/wireless/ath/ath12k/dp_rx.c |  6 +++++-
>  3 files changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index ad873013e46c..0291fbea6312 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -354,7 +354,10 @@ u32 ath12k_dp_tx_get_vdev_bank_config(struct ath12k_base *ab,
>  			u32_encode_bits(0, HAL_TX_BANK_CONFIG_EPD);
>  
>  	/* only valid if idx_lookup_override is not set in tcl_data_cmd */
> -	bank_config |= u32_encode_bits(0, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
> +	if (ahvif->vdev_type == WMI_VDEV_TYPE_STA)
> +		bank_config |= u32_encode_bits(1, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
> +	else
> +		bank_config |= u32_encode_bits(0, HAL_TX_BANK_CONFIG_INDEX_LOOKUP_EN);
>  
>  	bank_config |= u32_encode_bits(arvif->hal_addr_search_flags & HAL_TX_ADDRX_EN,
>  					HAL_TX_BANK_CONFIG_ADDRX_EN) |
> @@ -1107,11 +1110,8 @@ static void ath12k_dp_update_vdev_search(struct ath12k_link_vif *arvif)
>  {
>  	switch (arvif->ahvif->vdev_type) {
>  	case WMI_VDEV_TYPE_STA:
> -		/* TODO: Verify the search type and flags since ast hash
> -		 * is not part of peer mapv3
> -		 */
>  		arvif->hal_addr_search_flags = HAL_TX_ADDRY_EN;
> -		arvif->search_type = HAL_TX_ADDR_SEARCH_DEFAULT;
> +		arvif->search_type = HAL_TX_ADDR_SEARCH_INDEX;
>  		break;
>  	case WMI_VDEV_TYPE_AP:
>  	case WMI_VDEV_TYPE_IBSS:
> diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
> index 706d766d8c81..e3923ff02dbd 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.h
> +++ b/drivers/net/wireless/ath/ath12k/dp.h
> @@ -1330,6 +1330,8 @@ struct htt_t2h_version_conf_msg {
>  #define HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16	GENMASK(15, 0)
>  #define HTT_T2H_PEER_MAP_INFO1_HW_PEER_ID	GENMASK(31, 16)
>  #define HTT_T2H_PEER_MAP_INFO2_AST_HASH_VAL	GENMASK(15, 0)
> +#define HTT_T2H_PEER_MAP3_INFO2_HW_PEER_ID	GENMASK(15, 0)
> +#define HTT_T2H_PEER_MAP3_INFO2_AST_HASH_VAL	GENMASK(31, 16)
>  #define HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_M	BIT(16)
>  #define HTT_T2H_PEER_MAP_INFO2_NEXT_HOP_S	16
>  
> diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
> index 1abfbd15f13c..f83e34db83c0 100644
> --- a/drivers/net/wireless/ath/ath12k/dp_rx.c
> +++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
> @@ -1802,8 +1802,12 @@ void ath12k_dp_htt_htc_t2h_msg_handler(struct ath12k_base *ab,
>  					     HTT_T2H_PEER_MAP_INFO1_MAC_ADDR_H16);
>  		ath12k_dp_get_mac_addr(le32_to_cpu(resp->peer_map_ev.mac_addr_l32),
>  				       peer_mac_h16, mac_addr);
> +		ast_hash = le32_get_bits(resp->peer_map_ev.info2,
> +					 HTT_T2H_PEER_MAP3_INFO2_AST_HASH_VAL);
> +		hw_peer_id = le32_get_bits(resp->peer_map_ev.info2,
> +					   HTT_T2H_PEER_MAP3_INFO2_HW_PEER_ID);
>  		ath12k_peer_map_event(ab, vdev_id, peer_id, mac_addr, ast_hash,
> -				      peer_id);
> +				      hw_peer_id);
>  		break;
>  	case HTT_T2H_MSG_TYPE_PEER_UNMAP:
>  	case HTT_T2H_MSG_TYPE_PEER_UNMAP2:
> 
> base-commit: d33705bb41ff786b537f8ed50a187a474db111c1

Reviewed-by: Mahendran P <quic_mahep@quicinc.com>


