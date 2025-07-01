Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A01C7EE30
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 05:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3a7F5PuH9gknND+W8Ti1Rm442HHn3O4GA5Gg93HuB0=; b=ko6+DeXJbOdks7uhH/NhG03Av5
	qOL8GL3GrJy0AFwX0psocRt+K2PADw67koa+Zni3L2ExMX1xWAsLW/OFPLyZTrNJ7utf84CmD43kj
	tDy8yvOTLqdy5aCFoFIpp+FKNVhmJ3zQuQJLQ005Dvdw+0XJvtLGIcE0MoHpODz7wprloG1k1G0Xb
	TK4q8h4NbSuc5od3/UI+n8kwz3C4Vn05exg+xon4zINBArowpR8clnq+oGbkRfCCSObe0lK/w+1hj
	dhan5y9F+DQkjZuGqsHSJDQ6zG2arzP7n8rpQgje22779Z34QXRi21Q/5zoe5bmcon7ztnHUGUdKh
	/sEnimHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgL-000000043DZ-2Gzi;
	Tue, 01 Jul 2025 05:37:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgI-000000043C7-3x1J
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 05:37:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613juL0024791;
	Tue, 1 Jul 2025 05:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3a7F5PuH9gknND+W8Ti1Rm442HHn3O4GA5Gg93HuB0=; b=EV0xBWbGJCIayqJt
	tPgoWv7RKhkejtVitTBm+Or/VonI5VFdPnuWOX8hdnbuAMoM/Ox+EZztzQdPPLAm
	TZFvqCWBhuZtNNNotb/u9OzwWJ9b33sBjy02MB/VcgM5lhpZKDCUhWNUjUIb5+p0
	bHN8EDvrcjcF8rzZVGTcQMr6JrCcAF48atHE4vS2jMt1chzW6WldX8DM06imy7lf
	O+VhwCI0sW378NzVve84VX7d44qYk0INdC8I/rEjT13hwtvHILDoAMtXpPf4IHkS
	vENeQMl8uTIhki45GwahIM36rym8TVZm1lPYz2YvS43ev7N7c4vyuLGutbMvUpgQ
	oaQK+A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9f5p7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 05:37:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5615bKFX023456
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 05:37:20 GMT
Received: from [10.110.125.29] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 30 Jun
 2025 22:37:20 -0700
Message-ID: <588b49af-a72c-456f-872c-e63f664ebda6@quicinc.com>
Date: Mon, 30 Jun 2025 22:37:16 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V15 5/9] wifi: ath12k: fix TX and RX MCS rate
 configurations in HE mode
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
 <20250701010408.1257201-6-quic_pradeepc@quicinc.com>
 <ac2398f4-4720-4e15-bf8c-c588c7315960@oss.qualcomm.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <ac2398f4-4720-4e15-bf8c-c588c7315960@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68637411 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8
 a=ZUISTz8khJnI9srRkA4A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: zO0xluYBiW8k-B4OxWfEEdMCFudvXOsr
X-Proofpoint-GUID: zO0xluYBiW8k-B4OxWfEEdMCFudvXOsr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAyOCBTYWx0ZWRfXzP5zFJKmwwZe
 7zmLVgiIOCDUJR72/KkbcTT4T+4R1AIvfdEOpsJxx7mOf4oxVNYA59qyX6oNi7CmVn+bzEZ70A5
 XwQ13Bk4aeeR9bAWccgFFUVfOx7koB8qtNHL7yEYBXfybvELQb+d/bSnPtnSX+AM3ADPo3T4VNN
 ty0MtUII7l4DKBlQtgdQnMpA9I8dkmn2wZyKLhM02SbXxUVfVbdGpjR+sRs+kTl9wdBIylZDUuV
 gw3bYrQEd8ncA+uSTMDYKcqZXkD0hYJ3t4jXA43N1vFt6FjApnsDmTRgvjoUoGwLB9flgAGZBZR
 m4Wt8KZ4oYY5UIqgBm/niSGekrP4qyLRKfGdatduFPR7robT1NeH/Qz+UHfqNINdGrgFWTpZWnE
 grMhoVgXtZhKECOZuBJJprqo1J6YdokJEKDsh+JTElx15PFZWETGi7oaw6g2DIOPxHpoTF/n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_223723_143527_D623A935 
X-CRM114-Status: GOOD (  19.36  )
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



On 6/30/2025 7:14 PM, Baochen Qiang wrote:
> 
> 
> On 7/1/2025 9:04 AM, Pradeep Kumar Chitrapu wrote:
>> Currently, the TX and RX MCS rate configurations per peer are
>> reversed when sent to the firmware. As a result, RX MCS rates
>> are configured for TX, and vice versa. This commit rectifies
>> the configuration to match what the firmware expects.
> 
> Please mention that you are rectifying only for AP mode. For STA, current code is good.
Sure..technically I am changing for all modes except STA mode
> 
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
>> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> 
> I don't see the need to add my S-O-B here, better drop it.
Sure thanks
> 
>> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/wmi.c | 19 +++++++++++++++++--
>>   drivers/net/wireless/ath/ath12k/wmi.h |  2 ++
>>   2 files changed, 19 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
>> index 6c6354b3e18e..cdf3406302ee 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.c
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.c
>> @@ -2183,6 +2183,8 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>>   				   struct ath12k_wmi_peer_assoc_arg *arg)
>>   {
>>   	struct ath12k_wmi_pdev *wmi = ar->wmi;
>> +	struct ath12k_base *ab = ar->ab;
>> +	struct ath12k_link_vif *arvif;
>>   	struct wmi_peer_assoc_complete_cmd *cmd;
>>   	struct ath12k_wmi_vht_rate_set_params *mcs;
>>   	struct ath12k_wmi_he_rate_set_params *he_mcs;
>> @@ -2198,6 +2200,13 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>>   	u16 eml_cap;
>>   	__le32 v;
>>   
>> +	arvif = ath12k_mac_get_arvif(ar, arg->vdev_id);
>> +	if (!arvif) {
>> +		ath12k_warn(ab, "failed to find arvif with vdev id %d\n",
>> +			    arg->vdev_id);
>> +		return -EINVAL;
>> +	}
>> +
>>   	peer_legacy_rates_align = roundup(arg->peer_legacy_rates.num_rates,
>>   					  sizeof(u32));
>>   	peer_ht_rates_align = roundup(arg->peer_ht_rates.num_rates,
>> @@ -2333,8 +2342,14 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
>>   		he_mcs->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_HE_RATE_SET,
>>   							    sizeof(*he_mcs));
>>   
>> -		he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
>> -		he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
>> +		if (arvif->ahvif->vdev_type == WMI_VDEV_TYPE_STA) {
>> +			he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
>> +			he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
>> +
>> +		} else {
>> +			he_mcs->rx_mcs_set = cpu_to_le32(arg->peer_he_tx_mcs_set[i]);
>> +			he_mcs->tx_mcs_set = cpu_to_le32(arg->peer_he_rx_mcs_set[i]);
>> +		}
>>   		ptr += sizeof(*he_mcs);
>>   	}
>>   
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
>> index 0964ca03069a..7ad84624600d 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
>> @@ -4162,7 +4162,9 @@ struct ath12k_wmi_vht_rate_set_params {
>>   
>>   struct ath12k_wmi_he_rate_set_params {
>>   	__le32 tlv_header;
>> +	/* MCS at which the peer can receive */
>>   	__le32 rx_mcs_set;
>> +	/* MCS at which the peer can transmit */
>>   	__le32 tx_mcs_set;
>>   } __packed;
>>   
> 


