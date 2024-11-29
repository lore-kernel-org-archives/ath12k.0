Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305ACD70E02
	for <ath12k@archiver.kernel.org>; Fri, 29 Nov 2024 01:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=caA6irebOIwY1rFHYq+X5AoRXaI5Ow7UEDhgnYsFqv8=; b=UXLyAVrOyV98MZLspCg9d472mc
	DAcRkJfy/HCUKvL0lAdWEvSziKA9TIYFFZqHwPiARImuxcKwaH44pFeSyaotayN2ObdNuV1sqHhZ3
	YiWfGBmVn5IomnMXeYPAZtpUWUYxMlW44vKROO4vn29dfQrtD1v69qqxBxFsHN4Ea+9OHhd5qt7uj
	E8aMu5jh/GlwbFh7exwaoL3sGMj3P0i3yZIdvBsiBkKk2HtGjnPVBpEE/VQXcCbxu67Rxdo74hUi6
	mLnDCl/d6XNvfaR2RHr1h+2TYJqDGwEI5HjfaJnzL5Aak9OhKSDLxyIjgP5VCdu7IsPYYPcWLExw0
	M6RMv6yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq64-0000000GhC0-3rfM
	for ath12k@archiver.kernel.org;
	Fri, 29 Nov 2024 01:47:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGq62-0000000GhBc-0u5s
	for ath12k@lists.infradead.org;
	Fri, 29 Nov 2024 01:47:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ASNElWX017564;
	Fri, 29 Nov 2024 01:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	caA6irebOIwY1rFHYq+X5AoRXaI5Ow7UEDhgnYsFqv8=; b=WR5PrL8yuZjcNeX0
	MzeYouUi8o/5YQwuQgHh6tfV33uAUqL8p2IcjqMUH7jPXhjhZnhCvnGmZ9I0GFsF
	gSPWRzg8vi+QE6e0KrnpqRpEtcWeeq5hcd3NoqLINSjKIjaq+qCNJEGWBPF+1rOW
	ZfiPeHWXsy03zUoH59qt6D8b8Q2j7ple19XHZu8tFlnVPAgLkTbad/d4FfmiI0ID
	okRgmIsp63tUfd9ZPjLXo4Mxde3aU4cYX5W3hR0mBg42gGtkgRtZBMoc8MuH9xzq
	N8icfSgbij5k+RfNZZUzlWA30G8wecg3IlBUncT45SVI6WA+ouwa//3k0EI3lOc+
	0Bv5mA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4366xwv3er-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:46:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT1kwX3027555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Nov 2024 01:46:58 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 28 Nov
 2024 17:46:56 -0800
Message-ID: <3ab7b4c4-cbea-436e-8092-2e52c47761c3@quicinc.com>
Date: Fri, 29 Nov 2024 09:46:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] wifi: ath12k: do not return invalid link id for
 scan link
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20241126171139.2350704-1-kvalo@kernel.org>
 <20241126171139.2350704-7-kvalo@kernel.org>
 <abf0db61-326d-4b06-8ced-66d5f96d8dc0@quicinc.com>
 <87plmfv8oe.fsf@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <87plmfv8oe.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gR7qkRdQRCYaKuEXqjCe68Roie2YjDBr
X-Proofpoint-ORIG-GUID: gR7qkRdQRCYaKuEXqjCe68Roie2YjDBr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 lowpriorityscore=0
 mlxlogscore=568 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_174702_260815_AC0E07C5 
X-CRM114-Status: GOOD (  13.31  )
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



On 11/28/2024 8:34 PM, Kalle Valo wrote:
> Baochen Qiang <quic_bqiang@quicinc.com> writes:
> 
>> On 11/27/2024 1:11 AM, Kalle Valo wrote:
>>> From: Sriram R <quic_srirrama@quicinc.com>
>>>
>>> @@ -4317,14 +4327,14 @@ static void ath12k_mac_op_cancel_hw_scan(struct ieee80211_hw *hw,
>>>  					 struct ieee80211_vif *vif)
>>>  {
>>>  	struct ath12k_vif *ahvif = ath12k_vif_to_ahvif(vif);
>>> +	u16 link_id = ahvif->last_scan_link;
>>>  	struct ath12k_link_vif *arvif;
>>>  	struct ath12k *ar;
>>>  
>>>  	lockdep_assert_wiphy(hw->wiphy);
>>>  
>>> -	arvif = &ahvif->deflink;
>>> -
>>> -	if (!arvif->is_created)
>>> +	arvif = wiphy_dereference(hw->wiphy, ahvif->link[link_id]);
>>> +	if (!arvif || arvif->is_created)
>>
>> s/arvif->is_created/!arvif->is_created/ ?
> 
> Another good catch! Fixed now.
> 
>>> @@ -7990,6 +8011,19 @@ static struct ath12k *ath12k_mac_assign_vif_to_vdev(struct ieee80211_hw *hw,
>>>  	if (!ar)
>>>  		return NULL;
>>>  
>>> +	/* cleanup the scan vdev if we are done scan on that ar
>>> +	 * and now we want to create for actual usage.
>>> +	 */
>>> +	if (vif->valid_links) {
>>
>> better to use ieee80211_vif_is_mld()?
> 
> Yup, fixed in the pending branch:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=54504518cb26fef3dbaf16457cde91a9fd7e9c3d

LGTM

> 
> Thanks for the detailed review, very much appreciated.
> 


