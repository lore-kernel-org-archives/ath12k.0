Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E347CD1288
	for <ath12k@archiver.kernel.org>; Mon,  1 Apr 2024 19:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYe3zQKCXScnIQM1IEFH34Fj4R55r2F6P+Qqcd6GyXI=; b=pyFxezf63+ppOPPrpK7fG1tB3c
	vgDoqVqmgcuDIjyTI4KVfODYHOzu2Sj8dzOXnUg0xKal+hvCoxmd3R20sIJk39XKFhWChCSL3S/vX
	hRCHV0IxWXHx0IFPQ+ZIvMpOho5jpFWS3oTVS4M2uidJmq06QEj/cONW0/u3FK8u4Udc0qSjh2X7b
	TPX0z9jlpe/gHvF04/wRvIjYm5z5v/kIAykwxplpS81AGpwU79ws4Z0cJ03iWNlwUAt+fNatum+Ht
	o4D9TWbXwO0TaqxIkvpx6wDM60EmPZCKwaQkUbankDzM9O71LJWx7E41H3PwpZBZNflZoZrevnkOe
	GoX2iXzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrNQJ-00000008gnF-1qLw
	for ath12k@archiver.kernel.org;
	Mon, 01 Apr 2024 19:34:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrNQF-00000008gm9-2kDx
	for ath12k@lists.infradead.org;
	Mon, 01 Apr 2024 19:34:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 431JRmBM007500;
	Mon, 1 Apr 2024 19:34:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=HYe3zQKCXScnIQM1IEFH34Fj4R55r2F6P+Qqcd6GyXI=; b=HE
	/cSjQokW2rEeAiM2+F95J1gpZ1wxKDbWbyw2VnFqNx1s7nvV6I3khzOceGxcmHba
	YmopeSYjvapttNrxQ/aQ2HBJr0mxHT5shVl9i0RJKCdQG2xP0+kA3/advDaZDk/U
	o+n2dOBXPICSeNThIafOXL95K8yMfgS1QGy6N7Q3eqHvcGl4hvH9ezf4EWYFTHx0
	gaNVDdPFP+jgjIx9Y8M2dYGzvCcJfgbx3MUadqWjAByBAj/ZYiB5tIbr4wI+t4Y1
	NDECdg1R/XpgNkv1rJ9zeNJhrY63IM0Q9ioAS5xnM4/A/MId8iSpzxPeHOrEoElv
	VsLETIk7wF53mxa9cn8w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x7ucfh6rj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Apr 2024 19:34:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 431JYL1N005286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 1 Apr 2024 19:34:21 GMT
Received: from [10.110.126.136] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 1 Apr
 2024 12:34:21 -0700
Message-ID: <0d1058eb-aced-4e81-9f61-e4b5a08c04a2@quicinc.com>
Date: Mon, 1 Apr 2024 12:34:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/12] wifi: ath12k: Add single wiphy suppor
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
References: <20240401190409.2461819-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240401190409.2461819-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YnkGIfMD9bAHjb2X_Vh2-DpOhOVAOBe6
X-Proofpoint-ORIG-GUID: YnkGIfMD9bAHjb2X_Vh2-DpOhOVAOBe6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-01_14,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=932 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404010137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_123423_735498_4D4D46FD 
X-CRM114-Status: GOOD (  15.24  )
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

On 4/1/2024 12:03 PM, Rameshkumar Sundaram wrote:
> From: Sriram R <quic_srirrama@quicinc.com>
> 
> With the introduction of Multi Link Operation (MLO) support in
> IEEE802.11be, each EHT AP/non AP interface is capable of
> operating with multiple radio links.
> 
> cfg80211/mac80211 expects drivers to abstract the communication
> between such Multi Link HW and mac80211/cfg80211 since it depends
> on different driver/HW implementation. Hence the single wiphy
> abstraction with changes in datastructures were introduced in
> "wifi: ath12k: Introduce hw abstraction"
> 
> This patchset extends the implementation to allow combination
> of multiple underlying radios into a single composite hw/wiphy
> for registration. Since now multiple radios are represented by
> a single wiphy, changes are required in various mac ops that the
> driver supports since the driver now needs to learn on how to tunnel
> various mac ops properly to a specific radio.
> 
> This patchset covers the basic mac80211 ops for an interface bring up
> and operation.
> 
> Note:
> Monitor and hw reconfig support for Single Wiphy will be done in future
> patchsets.

thinking about this series in the context of some other patches I've been
reviewing recently, I don't think this series should be talking about
supporting multiple radios with a single wiphy, but instead about supporting
multiple devices with a single wiphy. After all, the existing logic already
supports a single device with multiple radios, so it isn't the multitude of
radios that is the issue, it is the multitude of devices.

this would have ramifications on many of the commit messages in this series.


