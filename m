Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9B3CD11BF
	for <ath12k@archiver.kernel.org>; Tue, 19 Mar 2024 15:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftcgkdEMHQjZVYLKhURwGfhXn3p1c1g2PGoGrx4YlZw=; b=hXvYf6h1xSQj+6JsOsy+dMMy3Q
	ll/gtkRHCXc4CMxc0lD4CEF4+i6zqMxQbugaQedRJO7Qt6EKTRLJlpGeqnQ4NDEKiK8/u1NScGat1
	h8qfnXPwhZVf5d6qFucvr/HUWZubxqEkB4ljiXl8czit0ysJz/EpKCJ8XHK5u0zaXeOe+KwIJJhXe
	mOeqyEAzWE/PvwY2lwsN1UhXo8frmApNWwnbK1448QMkEKY6YaAam6zMVK4VA4eHO+UAj8m9mAKYG
	JS0fgGuPdDb/YL4sRLlkIwlW5iwC7LlOBUKGxXvgQERRWxADLQxE3w4lFEdfcnNFPbr4I3PiW0iQG
	DrPBqwDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbrf-0000000DFwC-39ue
	for ath12k@archiver.kernel.org;
	Tue, 19 Mar 2024 15:58:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmbrb-0000000DFu1-1Tyb
	for ath12k@lists.infradead.org;
	Tue, 19 Mar 2024 15:58:57 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42JEwdUY009334;
	Tue, 19 Mar 2024 15:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=ftcgkdEMHQjZVYLKhURwGfhXn3p1c1g2PGoGrx4YlZw=; b=g3
	lUZq6JA3Ct+EAASep+wYSPjMglx3/v3Cw8/CbvxWVyVx3/Jm9O+Chtc5tI7KPEs3
	dUAf6A1FLJoZ8RH/XJ4n3DCGBCo87FazzkVMWs4UWuwLTyOiNfor6tMsR0l3JWO+
	fR8U0hSvEwS6RjJ49VznVMPqfIkgnU8K+npdSmh6hqjZEGuFhHrIKexKY8IzxUFr
	8IzvQzTBpjFoGugM8t3lwyGC7AqicT1a+BVV76VyFa7Hk5HFZaelHp872V3Vb28Y
	/Txpz05Ci4KZLNGhJY6Ruk9eVA0w1OUKF67hxdlMK+6I68H1nzZgMdrhNo+vil51
	VBh5Q9wGZeXQN9Haaaog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wy2e9hnke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:58:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42JFwqsH002232
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Mar 2024 15:58:52 GMT
Received: from [10.50.62.188] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 19 Mar
 2024 08:58:50 -0700
Message-ID: <34a993b5-7772-44d8-8be6-c754f9f05f82@quicinc.com>
Date: Tue, 19 Mar 2024 21:28:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/12] wifi: ath12k: scan statemachine changes for
 single wiphy
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
 <20240312135557.1778379-6-quic_ramess@quicinc.com>
 <34ffab82-44ec-485d-84a5-d5bd9aec9a85@quicinc.com>
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <34ffab82-44ec-485d-84a5-d5bd9aec9a85@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X4vz4ZZmKcBeEf7ryrwYZl_MpG7XGZ9H
X-Proofpoint-ORIG-GUID: X4vz4ZZmKcBeEf7ryrwYZl_MpG7XGZ9H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-19_05,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403190122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_085855_584523_9B49C0F8 
X-CRM114-Status: GOOD (  20.87  )
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



On 3/13/2024 4:05 AM, Jeff Johnson wrote:
> On 3/12/2024 6:55 AM, Rameshkumar Sundaram wrote:
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
> ...
>> +	/* If the vif is already assigned to a specific vdev of an ar,
>> +	 * check whether its already started, vdev which is started
>> +	 * are not allowed to switch to a new radio.
>> +	 * If the vdev is not started, but was earlier created on a
>> +	 * different ar, delete that vdev and create a new one. We don't
>> +	 * delete at the scan stop as an optimization to avoid reduntant
> 
> s/reduntant/redundant/
Sure will fix it in next version
> 
>> +	 * delete-create vdev's for the same ar, in case the request is
>> +	 * always on the same band for the vif
>> +	 */
> 

