Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078B9C4345F
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 09:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhhbsHGNsmfM4st8q4g55VM7ihGk1JTBYjuKEFL1YQU=; b=hYCr0cpNdoWEURlthZM1PFcr7A
	TKaL7/J3xFYfRaeCa7ShNzfikTo2xAIURHdxyosyVyrVAVHqjNTtY6BEp95EIvvj/86Qw836vNpBD
	BRmENeOzRpt3vRu5dV9cUs2+63mDlx5R2Ee/3BSL3QheMLBAduBWscuf46/fKoTkcZz0EWn0wVSFw
	2EUKgFdeINnQZ/M5hQ+do7veFmV2La0jsfzfpgvmYxRpEZcmMjkhZW5Dupkf2ubJvJh5QdCy/DTv1
	/Zip6p6L+jaKnhSN003Dhrv3mvlQg4SOfGJPLMMJJokqYBMQv8qllA+h4/8cgDFO+hAmZeP2FLmCi
	kxWIZzQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDTv-0000000GVHO-35pi
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 09:46:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvDTt-0000000GVGn-1nlz
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 09:46:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C6GR37011713;
	Fri, 12 Apr 2024 09:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fhhbsHGNsmfM4st8q4g55VM7ihGk1JTBYjuKEFL1YQU=; b=jN
	OpIGXex3xLxlvh+sz8OYRm9SOH028ESMUE8ufqSrd67W1QXQWzyfVbaVPv6UJVx0
	RvpPxFtSDBSided0vvj7ZLohHnlX5QM94u284vul5BfWc+Hfjg7OAm2V3g+CLlKd
	7mQPC2i8MNKBspsCgG61pHcHz9x5fnX2LFE5ndqjftdBo73eIbau4VIw3ZCeCrEK
	s3EvC1NntrNVY7Uq6sfiF2I1EpLUBch0Yx/eAo24h5e7aSDUd7uFn/xhUJwlSFFs
	Hm7dUV0TCE3TMq5dlSCRVhYae5E9rDv5MP0CJgj5OTN9Ztt5yrpQUd7hPnRY35wM
	kpZSYdifmbqRsL9Vgp6w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xesjbs36f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:45:59 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C9jwFN029723
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 09:45:58 GMT
Received: from [10.110.42.101] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 12 Apr
 2024 02:45:57 -0700
Message-ID: <70f73d7c-4ed1-4678-9eb4-7d4594af1df9@quicinc.com>
Date: Fri, 12 Apr 2024 17:45:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: report station mode signal strength
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240411025322.33888-1-quic_lingbok@quicinc.com>
 <20240411025322.33888-4-quic_lingbok@quicinc.com>
 <b2a14919-6478-4a6a-bdca-e018393eac34@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <b2a14919-6478-4a6a-bdca-e018393eac34@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ECaCi7fqBC0yGQMJU4iNtmP9YPjsANAz
X-Proofpoint-GUID: ECaCi7fqBC0yGQMJU4iNtmP9YPjsANAz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_06,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_024601_518544_922BA595 
X-CRM114-Status: GOOD (  18.70  )
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

On 2024/4/12 5:51, Jeff Johnson wrote:
> On 4/10/2024 7:53 PM, Lingbo Kong wrote:
>> Currently, the signal strength of "iw dev xxx station dump" always show an
>> invalid value.
>>
>> This is because signal strength is only set in ath12k_mgmt_rx_event()
>> function, and not set for received data packet. So, change to get signal
>> from firmware and report to mac80211.
>>
>> After that, "iw dev xxx station dump" show the correct signal strength.
>> Such as:
>>
>> Station 00:03:7f:12:03:03 (on wlo1)
>>          inactive time:  36 ms
>>          rx bytes:       61571
>>          rx packets:     336
>>          tx bytes:       28204
>>          tx packets:     205
>>          tx retries:     49
>>          tx failed:      0
>>          beacon loss:    0
>>          beacon rx:      83
>>          rx drop misc:   66
>>          signal:         -24 dBm
>>          beacon signal avg:      -22 dBm
>>
>> For WCN7850, the firmware supports db2dbm, so not need to add noise floor.
>> For QCN9274, the firmware not support db2dbm, so need to add noise floor.
>>
>> This patch affects the station mode of WCN7850 and QCN9274.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
>>
>> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/core.h |   2 +
>>   drivers/net/wireless/ath/ath12k/mac.c  |  56 ++++++++++-
>>   drivers/net/wireless/ath/ath12k/wmi.c  | 130 +++++++++++++++++++++++++
>>   drivers/net/wireless/ath/ath12k/wmi.h  |  48 +++++++++
>>   4 files changed, 234 insertions(+), 2 deletions(-)
> [...]
>> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
>> index 78afc94a815d..9016eda03d57 100644
>> --- a/drivers/net/wireless/ath/ath12k/wmi.h
>> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
>> @@ -4811,6 +4811,52 @@ struct wmi_twt_disable_event {
>>   	__le32 status;
>>   } __packed;
>>   
>> +struct wmi_stats_event {
>> +	__le32 stats_id;
>> +	__le32 num_pdev_stats;
>> +	__le32 num_vdev_stats;
>> +	__le32 num_peer_stats;
>> +	__le32 num_bcnflt_stats;
>> +	__le32 num_chan_stats;
>> +	__le32 num_mib_stats;
>> +	__le32 pdev_id;
>> +	__le32 num_bcn_stats;
>> +	__le32 num_peer_extd_stats;
>> +	__le32 num_peer_extd2_stats;
>> +} __packed;
>> +
>> +enum wmi_stats_id {
>> +	WMI_REQUEST_VDEV_STAT	= BIT(3),
>> +};
>> +
>> +struct wmi_request_stats_cmd {
>> +	__le32 tlv_header;
>> +	__le32 stats_id;
>> +	__le32 vdev_id;
>> +	struct ath12k_wmi_mac_addr_params peer_macaddr;
>> +	__le32 pdev_id;
>> +} __packed;
>> +
>> +#define WLAN_MAX_AC 4
>> +#define MAX_TX_RATE_VALUES 10
>> +
>> +struct ath12k_wmi_vdev_stats {
> 
> this name does not conform to the "Naming conventions for structures" outlined
> at the beginning of the file:
>   * _params is a structure which is embedded either into _cmd or _event (or
>   * both), it is not sent individually.
> 

Oh, thanks for pointing out.
I get what you mean, but the ath12k_wmi_vdev_stats belongs to event, so, 
i can changes it to wmi_vdev_stats_event, i will apply it in next version.

Best regards
Lingbo Kong


>> +	__le32 vdev_id;
>> +	__le32 beacon_snr;
>> +	__le32 data_snr;
>> +	__le32 num_tx_frames[WLAN_MAX_AC];
>> +	__le32 num_rx_frames;
>> +	__le32 num_tx_frames_retries[WLAN_MAX_AC];
>> +	__le32 num_tx_frames_failures[WLAN_MAX_AC];
>> +	__le32 num_rts_fail;
>> +	__le32 num_rts_success;
>> +	__le32 num_rx_err;
>> +	__le32 num_rx_discard;
>> +	__le32 num_tx_not_acked;
>> +	__le32 tx_rate_history[MAX_TX_RATE_VALUES];
>> +	__le32 beacon_rssi_history[MAX_TX_RATE_VALUES];
>> +} __packed;
> 

