Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF86DC369CB
	for <ath12k@archiver.kernel.org>; Tue, 29 Apr 2025 04:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AgxAh8ngai196lIsRMjynDeiT0inYH+VGZBuNyAHtd0=; b=2vMDsCQeRwSr6tX40TMnIiOv3X
	Tg6KrRWdg7NP3q3w5KU/4SMi61SWRwguVcNkzeLEbCeyMk2R15OR7EPu5OOYLWgu0VGz5hpqYlg58
	dkaM2sWdsO5nv+/eRHUam6fgTmQ6bWks0ILQjK8X97IOjqbWUU1IP19N3CGjEQGKx2zQOpdvEpgJP
	39UAEMfZfeoxglxBVZkTFZ7UYFpEIL8lWqvOkatFCh1qQkOte683+vffcP0xf1wD2jqq8SvbLq2V0
	lm7erUOxDXZpkcyghTW3ffcF/aI06RTB+UdxdeqLl1iyKxsE3L08OuKz1oXKO5FoxoAnEwf8bdqXy
	EHy07JyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cjG-00000008JWy-3208;
	Tue, 29 Apr 2025 04:37:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9cjE-00000008JWa-3Pc8
	for ath12k@lists.infradead.org;
	Tue, 29 Apr 2025 04:37:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqAV6013029;
	Tue, 29 Apr 2025 04:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AgxAh8ngai196lIsRMjynDeiT0inYH+VGZBuNyAHtd0=; b=Muiw8bBwH4k1rE4S
	CeGfJxoeo3Efmbis6pZ1YZmWRoJ7kO0hpyuN18jynxq0uPVNUljE0IOZAEHX0UFa
	KIN548AXTXDrlXl2QfOWDvaenakEXbkv75JIxAoCkCOLSTYg0uVHZMe51J/fsh4F
	Mr40lkj9frfd9qXAgCCWuGIRU25ttB9NASnYl7+BTxXXUWkmNzTMBwxRfW7rj4lT
	p0xp6yJ7gNdo1H4bfrHyqwF2dW7wBbDeiczOudExBVX3GlLk4yDzXJK0ACmKqwm8
	27/Yk+JiVpfPkLXl1iVIX3+VhuFHo13pcInyXX+tWkz9g+kKXTbgstXZPhLTonzQ
	Ufggew==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn2528-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:37:55 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T4btU9005386
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 04:37:55 GMT
Received: from [10.216.24.29] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 21:37:53 -0700
Message-ID: <c34320c3-84ab-47a4-b2bf-9cb68efc1c09@quicinc.com>
Date: Tue, 29 Apr 2025 10:07:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid RSSI values in station
 dump
To: Sowjanya vardhineni <quic_svardhin@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <praneesh.p@oss.qualcomm.com>
References: <20250424055104.2503723-1-quic_svardhin@quicinc.com>
From: Mahendran P <quic_mahep@quicinc.com>
Content-Language: en-US
In-Reply-To: <20250424055104.2503723-1-quic_svardhin@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2mxb1CTQy-78sdLD27lnW_Pu8_Y4Alrm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAzMyBTYWx0ZWRfXzEK+0tYGNwie gNXqtxyMf2LhtOF+x++FDWf8cxEDn261xCwnO9fBT/FzWJHGhhXuO7LuC3rYFxsRLMdFDpMqi5X hJU8+F6gQ1iDJiRj3VmeWoWcpDMzW3TarhstM1uiadLoAJs+2n2AbkVQRPTuCkL0ITgY4BwL/Nm
 1B/NiTgm3988tFF+a5whsDF89UqxdbJ2nmz0l67jdGOedZoGiGzh5VOj/p6l3h23bEI0kBx8KSM stVEJZniJU/fncQHIXTCuVlQhSo+VsfyZ16sKj+d4/C8G54IzuxCbjEiBA6U1WJ7n1MmfARIfHU +BFYKn48L/Lu6c5O0Q0wcmHnsCj1mjLEGA31spyB75VkcyG0tSYwXYvpaYIhlFSDrSHJp8p0Yr6
 9Nv3mjU9wSt/Veke0XTCuNyjbYa9369VcXFbeLjOTw1iCSF+7MooLbQZ/MczkcuWROF8OSk2
X-Proofpoint-GUID: 2mxb1CTQy-78sdLD27lnW_Pu8_Y4Alrm
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=681057a3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=K6L4iRK0gKkcvzKg9_MA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
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
X-CRM114-CacheID: sfid-20250428_213756_862014_CCDE26AE 
X-CRM114-Status: GOOD (  16.75  )
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

On 4/24/2025 11:21 AM, Sowjanya vardhineni wrote:
> From: P Praneesh <praneesh.p@oss.qualcomm.com>
> 
> When processing a "station dump" command, the driver retrieves RSSI
> values from the HAL_PHYRX_RSSI_LEGACY TLV received from the monitor
> destination ring, and reports them to userspace. Currently, the RSSI
> values reported are improper because the hardware has not been
> configured to update them properly.
> 
> To fix this, enable the HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO in
> the filter setup to ensure the correct RSSI values are returned in the
> HAL_PHYRX_RSSI_LEGACY TLV, resulting in correct RSSI values being
> reported to userspace.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> Signed-off-by: Sowjanya vardhineni <quic_svardhin@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index b19e30d95560..fa952f6ca4a3 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -229,7 +229,8 @@ ath12k_phymodes[NUM_NL80211_BANDS][ATH12K_CHAN_WIDTH_NUM] = {
>  const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default = {
>  	.rx_filter = HTT_RX_FILTER_TLV_FLAGS_MPDU_START |
>  		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END |
> -		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE,
> +		     HTT_RX_FILTER_TLV_FLAGS_PPDU_END_STATUS_DONE |
> +		     HTT_RX_FILTER_TLV_FLAGS_PPDU_START_USER_INFO,
>  	.pkt_filter_flags0 = HTT_RX_FP_MGMT_FILTER_FLAGS0,
>  	.pkt_filter_flags1 = HTT_RX_FP_MGMT_FILTER_FLAGS1,
>  	.pkt_filter_flags2 = HTT_RX_FP_CTRL_FILTER_FLASG2,
> 
> base-commit: 12b93f7c6d101d22e0ea3bf4a240699746c79117

Reviewed-by: Mahendran P <quic_mahep@quicinc.com>


