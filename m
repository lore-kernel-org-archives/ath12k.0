Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D039C25B76
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YQPDtBtAsPMOn6fSkt3mYqCWAApAF/8Zk3HZYCLl8nc=; b=A2DqNOH81sNtX8h5hQnVE40I0b
	LNLoFM57Bm+NBoSFMyVi7fgpJJv16BHOYm54BSNtGdHf6JQouGaqH8zPpNv0btbWMaIL7/GY5Jwy7
	R3g2iFzV/Ji9QZ9iIXmQXEbTgD3XjcMbnSUSVzopXO6g9n54efW/IO6isGeZbQUy6njbn7IYmctRM
	CR9MyIwK3Of54UyrCbxEel/yF+P+TaNxJB7GRfwrCBnMC213BiDOqz8McXp0L/fOKC5qYyQIiuZC+
	av8lv/8PDniJrH4jPuK9icLwRo6GNeQPyAmp1NbZ2SrwErzNqUviHHisyQ503y+nJpsMJ59+3jEgL
	pnFLHi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGvGz-00000007kcz-0qrb
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 06:46:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGvGw-00000007kcC-4Az8
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 06:46:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2D833008217;
	Tue, 11 Jun 2024 06:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YQPDtBtAsPMOn6fSkt3mYqCWAApAF/8Zk3HZYCLl8nc=; b=HMl+NFfYuMimcKdr
	daeqKE8IZdVbdZbyzh+Ad4c2mrqT2uj5SuMeOOsobmg3oPv5lc3+SZEgVfRT2Vx4
	rNIOi9iVdGJiA050X7F9WQKwTBbpzMTiRa3XOwqaGbEN88VH6p6f6fnI5OVJofAT
	50dctzF8kdlMHCk9GdRLuQf1AgdA9h8YtGAtEV89Aw2rAW13Edal3X8OQHmbarLa
	UWxrGMrz9iEZV3kNMJp0P+a4HAbOs+rGHPxLku3Kn/pvTheIucHni95fqgPa/5TF
	4GfSFbeeZU9HX0AGIc5G7NZf/blE/cEV5cSTIMP3tXTAUu9qqwmUTNys8fSZ9u/j
	PJMZIw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yme8rx25w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 06:46:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B6kAhH024849
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 06:46:10 GMT
Received: from [10.216.19.110] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 10 Jun
 2024 23:46:08 -0700
Message-ID: <a07a490f-3611-4e03-8ea4-7ce9fc4e3889@quicinc.com>
Date: Tue, 11 Jun 2024 12:15:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: modify remain on channel for single wiphy
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240528082739.1226758-1-quic_ramess@quicinc.com>
 <878qzcq4uc.fsf@kernel.org>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <878qzcq4uc.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Ki58VGm3q0pBSY4_d3tv8aYvCFMyEvTf
X-Proofpoint-GUID: Ki58VGm3q0pBSY4_d3tv8aYvCFMyEvTf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-11_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_234623_092496_FF216ACF 
X-CRM114-Status: GOOD (  26.78  )
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



On 6/10/2024 7:26 PM, Kalle Valo wrote:
> Rameshkumar Sundaram <quic_ramess@quicinc.com> writes:
> 
>> When multiple radios are advertised as a single wiphy which
>> supports various bands, vdev creation for the vif is deferred
>> until channel is assigned to it.
>> If a remain on channel(RoC) request is received from mac80211,
>> select the corresponding radio(ar) based on channel and create
>> a vdev on that radio to initiate an RoC scan.
>>
>> Note that on RoC completion this vdev is not deleted. If a new
>> RoC/hw scan request is seen on that same vif for a different band the
>> vdev will be deleted and created on the new radio supporting the
>> request.
>>
>> Also if the RoC scan is requested when the vdev is in started state,
>> no switching to new radio is allowed and RoC request can be accepted
>> only on channels within same radio.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> 
> I did some white space changes to the commit message.
> 
>> @@ -8416,12 +8416,63 @@ static int ath12k_mac_op_remain_on_channel(struct ieee80211_hw *hw,
>>   	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
>>   	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
>>   	struct ath12k_wmi_scan_req_arg arg;
>> -	struct ath12k *ar;
>> +	struct ath12k *ar, *prev_ar;
>>   	u32 scan_time_msec;
>> +	bool create = true;
>>   	int ret;
>>   
>> -	ar = ath12k_ah_to_ar(ah, 0);
>> +	if (ah->num_radio == 1) {
>> +		WARN_ON(!arvif->is_created);
>> +		ar = ath12k_ah_to_ar(ah, 0);
>> +		goto scan;
>> +	}
>> +
>> +	ar = ath12k_mac_select_scan_device(hw, vif, chan->center_freq);
>> +	if (!ar)
>> +		return -EINVAL;
>> +
>> +	/* If the vif is already assigned to a specific vdev of an ar,
>> +	 * check whether its already started, vdev which is started
>> +	 * are not allowed to switch to a new radio.
>> +	 * If the vdev is not started, but was earlier created on a
>> +	 * different ar, delete that vdev and create a new one. We don't
>> +	 * delete at the scan stop as an optimization to avoid redundant
>> +	 * delete-create vdev's for the same ar, in case the request is
>> +	 * always on the same band for the vif
>> +	 */
>> +	if (arvif->is_created) {
>> +		if (WARN_ON(!arvif->ar))
>> +			return -EINVAL;
>> +
>> +		if (ar != arvif->ar && arvif->is_started)
>> +			return -EINVAL;
> 
> I wonder if -EBUSY would be more descriptive here? I changed to that in
> the pending branch.
> 
Yeah, landing here would mean that user has already started the 
interface on a radio(ar) and now requesting RoC on a channel that 
doesn't belong to it.
>> +		if (ar != arvif->ar) {
>> +			/* backup the previously used ar ptr, since the vdev delete
>> +			 * would assign the arvif->ar to NULL after the call
>> +			 */
>> +			prev_ar = arvif->ar;
>> +			mutex_lock(&prev_ar->conf_mutex);
>> +			ret = ath12k_mac_vdev_delete(prev_ar, vif);
>> +			mutex_unlock(&prev_ar->conf_mutex);
>> +			if (ret)
>> +				ath12k_warn(prev_ar->ab,
>> +					    "unable to delete scan vdev %d\n", ret);
> 
> Do we really want to continue if vdev_delete() fails? In the pending
> branch I added 'return ret' here and modified the warning message a bit.
> 
>> +		} else {
>> +			create = false;
>> +		}
>> +	}
>> +
>> +	if (create) {
>> +		mutex_lock(&ar->conf_mutex);
>> +		ret = ath12k_mac_vdev_create(ar, vif);
>> +		mutex_unlock(&ar->conf_mutex);
>> +		if (ret) {
>> +			ath12k_warn(ar->ab, "unable to create scan vdev %d\n", ret);
>> +			return -EINVAL;
>> +		}
> 
> Also here I modified the warning message a bit.
> 
> The pending commit here:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=9b4ec32e921b34bd7a03d39cc0a75cba7e85dc02
> 
Changes looks fine for me, thanks a lot for Fixing them.

