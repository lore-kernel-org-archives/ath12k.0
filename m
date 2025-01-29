Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8E3C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 09:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPwj1JB3BIoLhCGHh8/sCfPKdHW7tg4TGTzPhb+4cZU=; b=bGAGyeSrpl5a6gHx9PjMC4efoy
	xM7twylkdXFe+S27SudF24gyMzVe3+NGvOY7NkixOpwWocnKyFWoF6kjUfrqO7NmcpNsC0Bf8R7YH
	MjVRziSLGvEiqcYAc8MdotDcBd53nBqXF65Loee8cKstOYLcJ5xS9ufw8PX3Yx2ZPRO6n2PBNqgD8
	uflaHVRa06HEUb/35yDGYgTs8CS2L4LkMG9KONwBsa16ZFyuXg9AMaBME1IjCy+tDOfX4AoBSI9Gr
	AD1TP9rXVruAFjwPoDkhxoZzUINLyDFYdyGSn0FcEoPMkEIx/CkN3gN0PVxI6K77t72q1hWfGA93E
	oVsguzXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td485-00000006cgC-3Eyu
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 09:13:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td482-00000006cfN-2tof
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 09:12:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T8T7L9013678;
	Wed, 29 Jan 2025 09:12:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gPwj1JB3BIoLhCGHh8/sCfPKdHW7tg4TGTzPhb+4cZU=; b=S4oD8t0kcaBR4nVl
	JfSOfjGvihX5uty+8fD3Ll90U9WYnGcbgLbHCmS2OZv+AFGoUtzY7amN4f8npCWs
	cR83XxEWZX3V8KsJkjhF4pNbfO5opYhLRsXdmc38Ty7hPpTLCIWHw0pvKbz5tacd
	+R9nb7YoGeoBFS2Y1iTM8EXcm0OJpdb7QKQDC3sjmikCTtExxisR90y4IU5mNCBT
	O03mghGejUWcitaIBxmdk663Z+WiSOwPqVVwR6Liy2hhchfIMkmaEJd7sVNgGUJD
	LIg2wn07NCmDaa8Qcx72/TjsaO9CWC8YDgoFyYA0ZhIlBD5Y0+OT80V0F4YaViZI
	bSS7aQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fguvg2af-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:12:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50T9Curr019627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 09:12:56 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 01:12:54 -0800
Message-ID: <ff2f41d5-7e79-3255-941d-64009d7f904a@quicinc.com>
Date: Wed, 29 Jan 2025 14:42:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v5 1/9] wifi: ath12k: Add HAL_PHYRX_GENERIC_U_SIG TLV
 parsing support
Content-Language: en-US
To: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20250127104738.4174862-1-quic_periyasa@quicinc.com>
 <20250127104738.4174862-2-quic_periyasa@quicinc.com>
 <35fcc2d4-519b-8f71-c722-7aceea590b0e@quicinc.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <35fcc2d4-519b-8f71-c722-7aceea590b0e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: DuQXVXDbfrnJS0QfYDAanZcSx2Cwu_CS
X-Proofpoint-GUID: DuQXVXDbfrnJS0QfYDAanZcSx2Cwu_CS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_011258_869629_83CBF39F 
X-CRM114-Status: GOOD (  16.74  )
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



On 1/29/2025 10:51 AM, Vasanthakumar Thiagarajan wrote:
> 
> 
> On 1/27/2025 4:17 PM, Karthikeyan Periyasamy wrote:
>> Currently, monitor is not enabled. However, in the future, the monitor
>> will be enabled. Therefore, add the necessary HAL_PHYRX_GENERIC_U_SIG TLV
>> parsing support in monitor Rx path, which help to populate the EHT
>> radiotap data.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI 
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Co-developed-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/dp_mon.c | 211 ++++++++++++++++++++++-
>>   drivers/net/wireless/ath/ath12k/hal_rx.h |  60 +++++++
>>   2 files changed, 270 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c 
>> b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> index 4e9a60181c06..4c8fe1b65fda 100644
>> --- a/drivers/net/wireless/ath/ath12k/dp_mon.c
>> +++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
>> @@ -10,6 +10,9 @@
>>   #include "dp_tx.h"
>>   #include "peer.h"
>> +#define ATH12K_LE32_DEC_ENC(value, dec_bits, enc_bits)    \
>> +        u32_encode_bits(le32_get_bits(value, dec_bits), enc_bits)
>> +
>>   static void
>>   ath12k_dp_mon_rx_handle_ofdma_info(const struct 
>> hal_rx_ppdu_end_user_stats *ppdu_end_user,
>>                      struct hal_rx_user_status *rx_user_status)
>> @@ -562,6 +565,193 @@ static void ath12k_dp_mon_parse_he_sig_su(const 
>> struct hal_rx_he_sig_a_su_info *
>>       ppdu_info->reception_type = HAL_RX_RECEPTION_TYPE_SU;
>>   }
>> +static enum hal_rx_mon_status
>> +ath12k_dp_mon_hal_rx_parse_u_sig_cmn(const struct hal_mon_usig_cmn *cmn,
>> +                     struct hal_rx_mon_ppdu_info *ppdu_info)
>> +{
>> +    u32 common;
>> +    u8 bw;
>> +
>> +    bw = le32_get_bits(cmn->info0, HAL_RX_USIG_CMN_INFO0_BW);
>> +
>> +    common = __le32_to_cpu(ppdu_info->usig.common);
>> +    common |= IEEE80211_RADIOTAP_EHT_USIG_COMMON_PHY_VER_KNOWN |
>> +          IEEE80211_RADIOTAP_EHT_USIG_COMMON_BW_KNOWN |
>> +          IEEE80211_RADIOTAP_EHT_USIG_COMMON_UL_DL_KNOWN |
>> +          IEEE80211_RADIOTAP_EHT_USIG_COMMON_BSS_COLOR_KNOWN |
>> +          IEEE80211_RADIOTAP_EHT_USIG_COMMON_TXOP_KNOWN |
>> +          ATH12K_LE32_DEC_ENC(cmn->info0,
>> +                      HAL_RX_USIG_CMN_INFO0_PHY_VERSION,
>> +                      IEEE80211_RADIOTAP_EHT_USIG_COMMON_PHY_VER) |
>> +          u32_encode_bits(bw, IEEE80211_RADIOTAP_EHT_USIG_COMMON_BW) |
>> +          ATH12K_LE32_DEC_ENC(cmn->info0,
>> +                      HAL_RX_USIG_CMN_INFO0_UL_DL,
>> +                      IEEE80211_RADIOTAP_EHT_USIG_COMMON_UL_DL) |
>> +          ATH12K_LE32_DEC_ENC(cmn->info0,
>> +                      HAL_RX_USIG_CMN_INFO0_BSS_COLOR,
>> +                      IEEE80211_RADIOTAP_EHT_USIG_COMMON_BSS_COLOR) |
>> +          ATH12K_LE32_DEC_ENC(cmn->info0,
>> +                      HAL_RX_USIG_CMN_INFO0_TXOP,
>> +                      IEEE80211_RADIOTAP_EHT_USIG_COMMON_TXOP);
>> +    ppdu_info->usig.common = cpu_to_le32(common);
>> +
>> +    switch (bw) {
>> +    default:
>> +        fallthrough;
>> +    case HAL_EHT_BW_20:
>> +        ppdu_info->bw = HAL_RX_BW_20MHZ;
>> +        break;
>> +    case HAL_EHT_BW_40:
>> +        ppdu_info->bw = HAL_RX_BW_40MHZ;
>> +        break;
>> +    case HAL_EHT_BW_80:
>> +        ppdu_info->bw = HAL_RX_BW_80MHZ;
>> +        break;
>> +    case HAL_EHT_BW_160:
>> +        ppdu_info->bw = HAL_RX_BW_160MHZ;
>> +        break;
>> +    case HAL_EHT_BW_320_1:
>> +    case HAL_EHT_BW_320_2:
>> +        ppdu_info->bw = HAL_RX_BW_320MHZ;
>> +        break;
>> +    }
>> +
>> +    return HAL_TLV_STATUS_PPDU_NOT_DONE;
> 
> Return code for this function and the below ones dont seem
> to have a real use in the callers. May be these can be made
> void instead?
> 

sure, will fix in the next version of the patch.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

