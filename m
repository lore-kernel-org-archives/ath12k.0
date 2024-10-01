Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCEECF6493
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+FiTzvYg/TRqYbWIoQ6cFsUX+Om6brwEohQgKsokvo=; b=uHyOH9EmV2n9X+HRXN+id1vY8/
	6fqG6Y427zBLjgEhvu5mng4gHvPqPnCEFjTRB/GGJLcDJ5ZCO5gCAszZ+qyGCpALCuM2N6ho8feES
	vN8wZJoImz1he/KODU4Hk+gHaPy+rloZVlGsHNOfco7wfLC0rGPIH6uwW3TE15t0RVqLKHp+DjUiq
	s+/NlmuYvLDIfcUh3mmO3DVytpYeMiPUS1jjnX6LBt/uwRB2Osx5OScou+xXFT2p8nx/Xqn5gDsuX
	DXHqmf1bVcvGD8ujMFTzBkq/KfHWzLIyK45yctLJwylKH5wT5Ci0YETomrd3tbFCGVQhfDa/Z7iBS
	X/oNSQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svXEP-00000001t4Y-3u9S
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 07:23:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svXBa-00000001snF-2Jxa
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 07:20:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UMKbV8032662;
	Tue, 1 Oct 2024 07:20:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a+FiTzvYg/TRqYbWIoQ6cFsUX+Om6brwEohQgKsokvo=; b=n7TJznjGE3AD/cCb
	xz3RK1lZNEMl8RL6qTQEyLVNZ1maSF54JoCS55DQ9VxL2sKJkOeuRbDtuHAMtl6/
	XKmFLEI7QT+S341y1Ynyt4JlwXu7FdpUCiM8qcG/wj//1qLMcba+FyaHQkHn7FrJ
	tUBqU3AVg6sl+mHVHBbjMa+dQxSTWZMZSQqPkzz2AsEprOM+3yu45+sqsrWdhtsN
	5wyvnj78GA5Jn6Cj6qhO7d3TyW44/LA931WKFDcE5lMk545v5pGjEstPQ2oEC6Sx
	tTEMYUZhEgo+9FUZcW/u9wWfHZSCvlX25LaYV/nso+g8Xo5TC+aYl1jErOgabFx3
	JWScKg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xaymf9xn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 07:20:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4917Kf3R007555
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 07:20:41 GMT
Received: from [10.152.202.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 00:20:39 -0700
Message-ID: <5baec254-9fe9-4923-ba38-c43bb9300508@quicinc.com>
Date: Tue, 1 Oct 2024 12:50:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: mac80211: fix assigning channel in activate links
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <20241001041518.2236297-1-quic_adisi@quicinc.com>
 <06708838017266efd2351f0bda1bf01b0ee2bef9.camel@sipsolutions.net>
Content-Language: en-US
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
In-Reply-To: <06708838017266efd2351f0bda1bf01b0ee2bef9.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: FZQPy0IjqeBHkBPXuqylvPXDAEDfSNum
X-Proofpoint-GUID: FZQPy0IjqeBHkBPXuqylvPXDAEDfSNum
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 mlxscore=0 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 mlxlogscore=800
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_002042_627811_4C7FD0E1 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

On 10/1/24 12:02, Johannes Berg wrote:
> On Tue, 2024-10-01 at 09:45 +0530, Aditya Kumar Singh wrote:
>> The current flow in _ieee80211_set_active_links() does not align with the
>> operational requirements of drivers that groups multiple hardware
>> under a single wiphy.
> 
> Btw, given that, I'd argue it's not really "fix ..." right now, since
> there's no such driver and no real bug? Dunno. But "fix" makes it sound
> like there's a bugfix, and it isn't now, it's just preparing for future
> ath12k compatibility.
> 

I see your point. Sure will rephrase the message and will not use 'fix' 
word in next version.

-- 
Aditya


