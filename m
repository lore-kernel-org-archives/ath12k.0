Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB07BC54E58
	for <ath12k@archiver.kernel.org>; Mon, 25 Mar 2024 15:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qV6RR5vIX0x7hRKoxdsGao6SrRroi0frYPQc0eV9E7Q=; b=nybGnY4nDkjh18EPR1bZssaUjI
	CtkS6ao7xPsJaRhwpH8+Zdq82d/TAAfyX0k0MAz/XDdPkZ7RkDZJ1QkUxcpSyAFkgSHOs4E2f1/mQ
	XXXiJ0vm+u8h/q5uxbbXFNMUEIO9bH8IPoKhNaD/YQ2Ow+bZ5UQ2FL47D46VIAuqPeNWzYZvfJZwJ
	izxrzGhAHno22YBBIUbQUE0lNo5HQav5hVIV45WIc1ugszKRQzS38N839NUPVyWXX5BZX5Z6ruY17
	K6Sw+VwG5gMN64INv5OCrhM3CEShWCwZzx7fNYQ/Ju4xqwYsyrQ33cFqftyB1C4neVi+hbHzwrSnu
	o9YUP48Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romBu-00000000TdM-1NOf
	for ath12k@archiver.kernel.org;
	Mon, 25 Mar 2024 15:24:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1romBq-00000000Taw-2Yms
	for ath12k@lists.infradead.org;
	Mon, 25 Mar 2024 15:24:48 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42PEOCr9015032;
	Mon, 25 Mar 2024 15:24:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=qV6RR5vIX0x7hRKoxdsGao6SrRroi0frYPQc0eV9E7Q=; b=OE
	Jp/fGyR3F9LjC3D8cXrcGPdh1ZDZ00OW912JWNoPUV37e9rLkBbB4XpaEVhCQD9V
	Wwkmx2SU891anu6OEwjz3/DXG0w1gNZdfOrufj/W6pDNDFUCQn+cE9Ii9BOe9H6w
	qJywzCEwrPP/2IvIblU6wsp8FISfi331lR/nlyM7inG6Zjc2oRs5B6pX0Oj1hx8E
	pmPFmZDnLVc3/k0/UMsuedIlmrKbn6SeyHoEUPEjRn+RyJM3ut+Lfoz7N4akKpUz
	CN6+LIifR680LXcAE8a9B4AIrLQKHH3666iL4i4u0jelSwELJax77oOSC99XHORS
	/0SDwQBOUTUVLsQgLXYQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x31wsseea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 15:24:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42PFOhXD009292
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 15:24:43 GMT
Received: from [10.216.55.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 25 Mar
 2024 08:24:41 -0700
Message-ID: <e5fe8dc4-c44b-4734-906f-a9dcbb724bb1@quicinc.com>
Date: Mon, 25 Mar 2024 20:54:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] wifi: ath12k: scan statemachine changes for
 single wiphy
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <20240320190943.3850106-6-quic_ramess@quicinc.com>
 <85e7f591-ed52-4554-bd92-09086eaebcdb@quicinc.com>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <85e7f591-ed52-4554-bd92-09086eaebcdb@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jzoHQfcM_1Vw4Nq_OKpo0pfJN1T9M3kb
X-Proofpoint-ORIG-GUID: jzoHQfcM_1Vw4Nq_OKpo0pfJN1T9M3kb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_12,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_082446_695172_9BA40BDD 
X-CRM114-Status: GOOD (  23.97  )
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



On 3/22/2024 1:24 AM, Jeff Johnson wrote:
> On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
>> From: Sriram R <quic_srirrama@quicinc.com>
>>
>> When multiple radios are advertised as a single wiphy which
>> supports various bands, a default scan request to mac80211
>> from cfg80211 will split the driver request based on band,
>> so each request will have channels belonging to the same band.
>> With this supported by default, the ath12k driver on receiving
>> this request checks for one of the channels in the request and
>> selects the corresponding radio(ar) on which the scan is going
>> to be performed and creates a vdev on that radio.
>>
>> Note that on scan completion this vdev is not deleted. If a new
>> scan request is seen on that same vif for a different band the
>> vdev will be deleted and created on the new radio supporting the
>> request. The vdev delete logic is refactored to have this done
>> dynamically.
>>
>> The reason for not deleting the vdev on scan stop is to avoid
>> repeated delete-create sequence if the scan is on the same band.
>> Also, during channel assign, new vdev creation can be optimized
>> as well.
>>
>> Also if the scan is requested when the vdev is in started state,
>> no switching to new radio is allowed and scan on channels only
>> within same radio is allowed.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath12k/mac.c | 211 +++++++++++++++++++++-----
>>   1 file changed, 176 insertions(+), 35 deletions(-)
> ...
>> -static void ath12k_mac_op_remove_interface(struct ieee80211_hw *hw,
>> -					   struct ieee80211_vif *vif)
>> +static int ath12k_mac_vdev_delete(struct ath12k *ar, struct ieee80211_vif *vif)
>>   {
>> -	struct ath12k *ar;
>>   	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>> -	struct ath12k_base *ab;
>> +	struct ath12k_base *ab = ar->ab;
>>   	unsigned long time_left;
>>   	int ret;
>>   
>> -	if (!arvif->is_created)
>> -		return;
>> -
>> -	ar = arvif->ar;
>> -	ab = ar->ab;
>> -
>> -	mutex_lock(&ar->conf_mutex);
>> -
>> -	ath12k_dbg(ab, ATH12K_DBG_MAC, "mac remove interface (vdev %d)\n",
>> -		   arvif->vdev_id);
>> -
>> -	if (arvif->vdev_type == WMI_VDEV_TYPE_AP) {
>> -		ret = ath12k_peer_delete(ar, arvif->vdev_id, vif->addr);
>> -		if (ret)
>> -			ath12k_warn(ab, "failed to submit AP self-peer removal on vdev %d: %d\n",
>> -				    arvif->vdev_id, ret);
>> -	}
>> -
>> +	lockdep_assert_held(&ar->conf_mutex);
>>   	reinit_completion(&ar->vdev_delete_done);
>>   
>>   	ret = ath12k_wmi_vdev_delete(ar, arvif->vdev_id);
>>   	if (ret) {
>> -		ath12k_warn(ab, "failed to delete WMI vdev %d: %d\n",
>> +		ath12k_warn(ab, "failed to delete WMI scan vdev %d: %d\n",
> 
> this change seems strange. isn't ath12k_mac_vdev_delete() called from both the
> scan logic and from the normal ath12k_mac_op_remove_interface(), so it might
> not be a scan vdev that is being deleted?
> 
No, in Single wiphy, the vdev logic creation for an arvif is such that 
at any given point of time only one vdev is created for an arvif (either 
by ath12k_mac_op_add_intf/assign_chanctx/hw_scan).
Vdev created by mac_op_scan can either be re-used or deleted & 
re-created (on a different ar) by mac_op_assign_chanctx() if required.
Also once mac_op_assign_chanctx has started the vdev of an arvif, 
mac_op_hw_scan can only use that vdev. So mac_op_remove just simply 
deletes the one that is currently created.
>>   			    arvif->vdev_id, ret);
>>   		goto err_vdev_del;
>>   	}
> 

