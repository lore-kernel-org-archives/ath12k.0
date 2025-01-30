Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C872C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 20:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=elDICj/q/FYey3BXsVqOFIdUS21Q0d0uvpkLxBMskGw=; b=D7JA6w67qwirmi0YOJ1xbqnGe0
	j5jrjA5wEefREIx6iekwxcudrbhzxBXWGetg3lrU6+1c5hfvLmkTzWuzZqfQVq95JiIQWFX0/fd4z
	jPCq3eo2nS09hmsH12HGtwArk02u+mSGi39Rapspq5PNArPd5DTpcJ0JrWznDLiZj3e7hEDGixOQo
	EOnqX3CqNqI4vTVEcldGDChE5zOnwnOKD6nVSW7pdh+MLDX78yQ+vIOuwFfw2LmcCW9eQGOlO5G6X
	girpRyRpWnek8CPwf6nnvT5gBb8+zKB6MMPuGCdX9IkESb7v+PfOgyDZRUiF9Xv3r3UxLQ4lBw+7w
	TAB6F1DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdaoB-00000009Xgg-0Y0N
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 20:06:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdao8-00000009Xfv-1N4K
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 20:06:37 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50UJ1qQT011830;
	Thu, 30 Jan 2025 20:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	elDICj/q/FYey3BXsVqOFIdUS21Q0d0uvpkLxBMskGw=; b=N0MqkcqHWsE78GmY
	F3HKBIL0nrlZPeonCTjBB31d5MQbi3xRcTDYk6NVvup/c4tCe0bELtY4+Fak0DCE
	UyLA/6KhGWqs0P+WLDErRDbLkQ8in7+lkRKeU7/AYR5yBMZ+nXvxmDpx7JUpbgfN
	P+aI4injRgbpQZ2Uu8DfKi0qJs1AUnjvM60AKMzl//ou67rhppW7ayfGor5Ho785
	7ldVSHu+/6hOecge+SS5ej2jH2pgGwUechKfYq1Y8Vc/C3Qzfm6rHNsg4esz9+wA
	lNJ+0HyoLHJeMnnSzYhI1Wsp3P9XFIDnvwpCbBVO4TQiHZjssPxnqmCHdCzuFwjz
	cIHGDg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44gf7k04wc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:06:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50UK6WZ9028144
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jan 2025 20:06:33 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 30 Jan
 2025 12:06:31 -0800
Message-ID: <03c90a4d-64b7-4ad1-9139-7614bd33707c@quicinc.com>
Date: Thu, 30 Jan 2025 12:06:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: <mbizon@freebox.fr>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
 <20250114003813.2783550-7-quic_pradeepc@quicinc.com>
 <f5c6d874e9d7682d52c5ed107a0ede952b5cf53f.camel@freebox.fr>
 <5861c953-436e-4f36-ae8b-5ef52fceb3b6@quicinc.com>
 <2aba18dc3448b5a60a1a06b33fa591e562927693.camel@freebox.fr>
 <961df6e7-0b5c-4972-9324-5c4d430cb172@quicinc.com>
 <54d456f00aa8a806768099df55dc9f2ef734209b.camel@freebox.fr>
 <dedfdb8e-c5b4-42fa-bd76-ca866ab1cf41@quicinc.com>
 <1a6316872ecb6b49cbaab70d5e8fd01e78fe0ba6.camel@freebox.fr>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <1a6316872ecb6b49cbaab70d5e8fd01e78fe0ba6.camel@freebox.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 95q1PCxRa8a5N6-l2v6TXhmfkXW1Bsg3
X-Proofpoint-GUID: 95q1PCxRa8a5N6-l2v6TXhmfkXW1Bsg3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-30_09,2025-01-30_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 adultscore=0 bulkscore=0 suspectscore=0 mlxlogscore=718 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2501300152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_120636_392177_F76EA49C 
X-CRM114-Status: UNSURE (   6.73  )
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


> Assuming my understanding is correct, should you not adapt
> ath12k_peer_assoc_h_ht() to match this semantic ?
> 
Hi Maxime,

Thanks for your comments..Looks like the definitions were added mainly 
for test purposes to force SGI/LGI: 
https://patchwork.kernel.org/project/linux-wireless/patch/1389167162-3681-1-git-send-email-janusz.dziedzic@tieto.com/

While following the semantic might improve code readability, based on 
current firmware capabilities, we can force LGI when user sets 
set_bitratemask but cannot force SGI always as firmware might endup 
choosing LGI when PER is high.

let me make changes in next revision accordingly.

Thanks
Pradeep

