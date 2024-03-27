Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F84EC54E67
	for <ath12k@archiver.kernel.org>; Wed, 27 Mar 2024 12:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrQzsn87xaPozpOsr6mrbRGEBewC/DvcdWCLtE3LggY=; b=5A9+Nd+3s7rB6NfVF4AhHIwNP6
	f5FVxbpCJCkiBnw8hkwcsHHH3kj4O5bOUeqjG2j3zIKMIwFJrIcJeAZ8nCEML7I5VxWqoGbjamJs5
	pjzQXvnR9TUhE0xSqDc6MIg0yKqv6n7Y4UJOkuUG30gqjypA4DaU45Ndm0Ay0L8pVNwZP2HYmgIfZ
	SJW39B6VCbrVHmdTvyLyssPX0y6alDuf4lVO5d51EePrxZgSaTFfXSbi7hWCEEtYs7ai97YeVWzHr
	uk9juaQpABgj6/Q0soTrtqoqIM3bgGcCPERxbD/y6DnXbL8346AqTGtMltYk0Y/oBJwy//equmXIr
	m/rGKI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSo1-000000091rP-3I13
	for ath12k@archiver.kernel.org;
	Wed, 27 Mar 2024 12:55:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSny-000000091q2-0Trp
	for ath12k@lists.infradead.org;
	Wed, 27 Mar 2024 12:54:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42RAZfX5023903;
	Wed, 27 Mar 2024 12:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=FrQzsn87xaPozpOsr6mrbRGEBewC/DvcdWCLtE3LggY=; b=jh
	7i9jbnTPz+T+4WRdYruqZu7uz7IAMT1bGRQMebdLoFvQQQu3nOU3Xwyn5ocwnwkT
	8NyKLgPWXc2RvW7ps2I0MHnmqika9sLj3t0d06izLbgxHESWs1HrX75k3BM+eFgX
	an67XaQHW7o80tdbNXYIvWwCIti1YE19d4NHCSum29py8BUQZQrRtLSbbJYp66Fl
	6GSTtADgjvv64wzzs54NSMsJWabvD6FY0hqfudD5SWj3crA1F7UJ1AwoQNgLcaM4
	7D2MptpW6NkLa0ryapcXD2hqRMsHgP0ZRnyCMaOBLAoLnFu8R3/VSeazql5RQL+W
	rS9yLn1h97YGgChkxuNA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4hu2rb8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 12:54:46 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42RCskt1011989
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 12:54:46 GMT
Received: from [10.110.105.230] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 27 Mar
 2024 05:54:45 -0700
Message-ID: <3f5b9e74-d898-416b-9b08-d008883c7e58@quicinc.com>
Date: Wed, 27 Mar 2024 20:54:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: report signal for iw dev xxx station dump
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240219111417.1185-1-quic_lingbok@quicinc.com>
 <87o7b8amcn.fsf@kernel.org>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
In-Reply-To: <87o7b8amcn.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EyqYlXtp9seqaVCzx4qFOCmnhiwXSEkO
X-Proofpoint-GUID: EyqYlXtp9seqaVCzx4qFOCmnhiwXSEkO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_08,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_055458_227239_DA28295B 
X-CRM114-Status: GOOD (  21.80  )
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



On 2024/3/21 0:39, Kalle Valo wrote:
> Lingbo Kong <quic_lingbok@quicinc.com> writes:
> 
>> The signal of "iw dev xxx station dump" always show 0 dBm. This is because
>> currently signal is only set in ath12k_mgmt_rx_event function, and not set
>> for rx data packet. So, change to get signal from firmware and report to
>> mac80211.
> 
>>   	/* TODO: Use real NF instead of default one. */
>> -	sinfo->signal = arsta->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
>> -	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
>> +	signal = arsta->rssi_comb;
>> +
>> +	if (!signal &&
>> +	    arsta->arvif->vdev_type == WMI_VDEV_TYPE_STA &&
>> +	    ar->ab->hw_params->supports_rssi_stats &&
>> +	    !(ath12k_mac_get_fw_stats(ar, ar->pdev->pdev_id, 0,
>> +				      WMI_REQUEST_VDEV_STAT)))
>> +		signal = arsta->rssi_beacon;
>> +
>> +	if (signal) {
>> +		sinfo->signal = signal;
>> +		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
>> +	}
>>   }
> 
> If I'm reading the patch correctly this is the sequence:
> 
> 1. ath12k_mac_op_sta_statistics() is called
> 
> 2. WMI_REQUEST_STATS_CMDID is sent to the firmware
> 
> 3. ath12k_mac_op_sta_statistics() returns
> 
> 4. firmware sends WMI_UPDATE_STATS_EVENTID to host
> 
> 5. ath12k_wmi_tlv_fw_stats_data_parse() stores signal to arsta->rssi_beacon
> 
> So doesn't this mean that ath12k_mac_op_sta_statistics() actually uses
> the previous value? And if ath12k_mac_op_sta_statistics() is called very
> seldom, like once an hour, the signal value can be one hour wrong?
>

Hi, kalle, you're right.
Thanks you for pointing this out.

I should add a struct completion to make up the synchronization mechanism.

So, i add a struct completion in struct ath12k, then modify the 
ath12k_mac_get_fw_stats() function:

+static int ath12k_mac_get_fw_stats(struct ath12k *ar, u32 pdev_id,
+                                  u32 vdev_id, u32 stats_id)
+{
+       struct ath12k_base *ab = ar->ab;
+       int ret, left;
+
+       mutex_lock(&ar->conf_mutex);
+
+       if (ar->state != ATH12K_STATE_ON) {
+               ret = -ENETDOWN;
+               goto err_unlock;
+       }
+
+       reinit_completion(&ar->fw_stats_complete);
+
+       ret = ath12k_wmi_send_stats_request_cmd(ar, stats_id, vdev_id, 
pdev_id);
+
+       if (ret) {
+               ath12k_warn(ab, "failed to request fw stats: %d\n", ret);
+               goto err_unlock;
+       }
+
+       ath12k_dbg(ab, ATH12K_DBG_WMI,
+                  "get fw stat pdev id %d vdev id %d stats id 0x%x\n",
+                  pdev_id, vdev_id, stats_id);
+
+       left = wait_for_completion_timeout(&ar->fw_stats_complete, 1 * HZ);
+
+       if (!left)
+               ath12k_warn(ab, "time out while waiting for get fw 
stats\n");
+err_unlock:
+
+       mutex_unlock(&ar->conf_mutex);
+       return ret;
+}

then add "complete(&ar->fw_stats_complete);" at the end of 
ath12k_wmi_tlv_fw_stats_data_parse() function.

what do you think of this?

> Also I don't see any protection when accessing arsta->rssi_beacon.
> 

i think add protection is unnecessary when accessing arsta->rssi_beacon 
in ath12k_mac_op_sta_statistics() function, because we just take its 
value and don't change it.

Best regards
Lingbo Kong

