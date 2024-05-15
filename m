Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6989DC25B79
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 16:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ocnp25BKndipHW0hJDja/0FBH5DhK3l/5UBX3iyeZlg=; b=Aiy8kqZ3n8oS35kvcQS53/HTDN
	ooZwX0I2TftvLy1yi+JS5X15TnIR4rcTabZtxrIDZwsS3UW/8LG0TyyrZwtKyJfCXJow5S/sonyDJ
	g8Hv1Q2FPHC6GtIunc3JanUjNzTIegGxHEhV6eVS/Kv+5xntZq7NtIBklJqbz2qbQzKt1TtIqVGE3
	0AzPwmtTsjoXE5Imwl1pmDLroAdlysNHVLfBwyA/INbIlTJ5N9Z5NT+NuYmlwm6VnwKFxXgPi1uLz
	RYJet5WH8Arq+smL6ivxtslsU4o3oA3eWIDRnV5nP2kH8g7WZ8zvPR6lEXUHDjkCd+SeoTePVK/9V
	tn/nkEZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HDM-000000023oh-43bb
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 16:10:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7HDJ-000000023mp-0j1Z
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 16:10:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90YQ6026428;
	Wed, 15 May 2024 16:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ocnp25BKndipHW0hJDja/0FBH5DhK3l/5UBX3iyeZlg=; b=Un
	fC9GOK8Ec0MpyT3Tx+fREcuMwkVyX8EgHBGAc0+EqRKCqth4QjFmzNsPqgp1PGyB
	dJHXQ2w042fzTwUViTM7f8OxZEXfsMh3p4L937CYFAavnHfswqEebzSpLa5+c1xZ
	2312lS/S/tkw4ORdYewsNJuH/sWPFhHr/kyq31yISv/TjB4O4gYKQDTBN9TOAAT0
	U7kd5KvolL7HtGPu5+vrFMF5HXUkC+Mj5icGhJpJTYlvvbnUDSFJKKwHriS1afAm
	5GKT7kC3/pRUdkBMJWdc8HSmy82cnimR3WhsyTTziHfUEB4Xi5P5tQ+YoSOOToxW
	u/K0MHRubxJQ0K8Zc/Tg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y47egb8qc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:10:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FGAhQD022369
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:10:43 GMT
Received: from [10.227.108.41] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 May
 2024 09:10:42 -0700
Message-ID: <ce6cf9f2-d10d-4459-b894-47b08bcf7af5@quicinc.com>
Date: Wed, 15 May 2024 09:10:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 09/10] wifi: ath12k: add support for 160 MHz bandwidth
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
References: <20240508002055.17705-1-quic_pradeepc@quicinc.com>
 <20240508002055.17705-10-quic_pradeepc@quicinc.com>
 <4ce44353-994e-4ae5-8f5a-9bb19d31ba9d@quicinc.com>
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <4ce44353-994e-4ae5-8f5a-9bb19d31ba9d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eO7Psm5oflbqe0PGyyrFGRrroGanUDLc
X-Proofpoint-ORIG-GUID: eO7Psm5oflbqe0PGyyrFGRrroGanUDLc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_10,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 malwarescore=0 phishscore=0 spamscore=0 mlxlogscore=971 lowpriorityscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_091045_754165_92D42F67 
X-CRM114-Status: UNSURE (   6.59  )
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



On 5/13/2024 1:54 PM, Jeff Johnson wrote:
> On 5/7/2024 5:20 PM, Pradeep Kumar Chitrapu wrote:
>> Add support to configure maximum NSS in 160 MHz bandwidth.
>> Firmware advertizes support for handling NSS ratio information
> 
> s/advertizes /advertises /
> 
> (one of the exceptions where US English doesn't use z)
Sure.will address in next revision

