Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7FAC3DA49
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7c1qU95BUtwE0lPsqJ4yybXqIL2pPOipfIPE52BXWyM=; b=Ylv3ii/yCjE0FwReEMq7ZH9Zn9
	eys4AGv5I3XCMe0dryWRg0T29HxCw+n1mnl6UVFXWN5fyIze73BeO5jAk7wnRzqsBe34OC8QVJPBj
	amieUM7IHNbK8qc0Ep6ixsy9XrInVz3M/KqBgDy/yNAVPTn74qS3DskA4KUFVDNO3IZ+humRUF1JG
	9guzBnBDMn0OyUykITKaO7j+hU1FSWQTE6Eso2KQw/ZmBN6c87Ibc84iVNNgAPoT/b76wj8om5/BW
	OSXCWjQDoKEHgJsgoZdZJc//s1m2jXv/Y9HPftFQ0pVI8mQ5aQEyOJQimtbd9M1yxUtYjH72auz80
	dh+aK1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8em-00000002VAi-3vrH
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:18:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8ek-00000002V8w-0z1e
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:17:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PJ1LqX024250;
	Fri, 26 Jul 2024 00:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7c1qU95BUtwE0lPsqJ4yybXqIL2pPOipfIPE52BXWyM=; b=YageqaAQhe63sbq/
	/O0PziqF5YO89LkQ5N1deIhSMg0wJMBpz8/cLzFNlLaxQ3yPFLr0Pp3yTdOKuNOf
	6Rq8rdDme9kIjeFpILn+GyXde0+E23Mzqr54QGsYoSHu5fBMHY550AlSMHEY+RyL
	gzQOb1vU5eEWagIzznpNobJR5LdiUW4AUqiu6oJTkzH2YbP031UQiJLRhpiJjPao
	epjpQQTLup3gq/P7C1rxspEFYetzfr0Czis6PEH6qi2WBjgrTYa0R7DYlkxQIkr7
	F7lFhDNRXZTZ4+ycdjtBe/NC5m0GCTI7a5Q75U90ST5kSq1oEoxe4k/rEBkMh4sx
	QvygpQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g487phnh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0Humm031106
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:17:56 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:17:55 -0700
Message-ID: <2d958bc0-72a1-493b-a46a-356f8d89b696@quicinc.com>
Date: Thu, 25 Jul 2024 17:17:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/11] wifi: ath12k: properly handling the state variables
 of monitor mode
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-8-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-8-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MIgrLr1gXjGjZkk6WziUpYB4lymTnGYX
X-Proofpoint-GUID: MIgrLr1gXjGjZkk6WziUpYB4lymTnGYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 mlxlogscore=975
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407260000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171758_446807_CBA2C8BF 
X-CRM114-Status: GOOD (  10.38  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> Now monitor mode has some status variables, such as monitor_started,
> monitor_vdev_created. They are not always handled correctly.
> 
> For monitor_started, it should be true when driver works in monitor
> mode, and should be false at other times.
> 
> For monitor_vdev_id, it should be -1 when driver doesn't work in monitor
> mode.
> 
> For monitor_vdev_created, it should be true after monitor vdev is
> created successfully and should be false at other times.
> 
> For monitor_conf_enabled, it should be true when mac80211 sets
> IEEE80211_CONF_MONITOR, and should be false at other times.
> 
> Handle those state variables according to above descriptions.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>



