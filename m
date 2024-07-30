Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9C3C3DA70
	for <ath12k@archiver.kernel.org>; Tue, 30 Jul 2024 16:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pjNQjmEtQshjgupf7ubr+Q5otLoPs32n3uBz33/+FcY=; b=0IyOiMqcBH0JfaDDjqZOITigck
	QXGYuRm4Yxe/hFjqVHmmcg5ilIHA+fUzbAXaNkJ0SFH9ueaR2qob5kRK9R4JAMyVW0zVRTIcMTCp1
	6rNC0G886KiWpw5lSqN6UCVdYFuw2Xm+gv//y2RmFHVCGD9oAiBAPlmzxR3Eh5FJdYBvIxM9a/CfM
	WFuhYMs1f85IYZ1kT77UG8l/NCAF2uMLICoqlrUuH15Uvls6gQmEg6dUS39iXTwhF0Ad2BM5SSw0x
	hZZxxCONWcyX1W38nUxiDbYMjKvbVuY9PGdvWZdQ3wOHB3DE+Yqu74GSQS6b2xaWm/S8UJ6JGwbZU
	PYXJB3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYpVh-0000000FoNI-3mY0
	for ath12k@archiver.kernel.org;
	Tue, 30 Jul 2024 16:15:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYoUx-0000000FbV8-08Xw
	for ath12k@lists.infradead.org;
	Tue, 30 Jul 2024 15:10:49 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U9NCJ1021139;
	Tue, 30 Jul 2024 15:10:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjNQjmEtQshjgupf7ubr+Q5otLoPs32n3uBz33/+FcY=; b=Z64rV9eEmwUolICt
	cIQWXlwm8hI7hWr96ItX+zjymlwtd0wIINMz+sexEfqq3ThFER4nQQwr4/kkId8f
	nPkCoA+mTuqo3MRIndXsKW/vK8b18Zxgb1wQNImjK3fCzuvCZnK35/fRKnkZPubQ
	ok44cY20cCZgUKHEG3/CNhLhzzEjcbuikDZqOf/X4oErAZbpCLh2o1PEpCOaEgtj
	htJvfItBNFj5tvkq1NIRD+i0DZY9/ruf0PEnuoxJvbqBlfqXyTogeXlaTr8tLrz5
	l8Vtkp/NijjthTGL9pRPZ9QUwYpMX47dsb+L9dHFTdr/CnXdpVZmaTSLXiZ37GTX
	VDEDqQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mqw77y13-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 15:10:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46UFAiwv032243
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 15:10:44 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Jul
 2024 08:10:44 -0700
Message-ID: <f7a78f85-db8a-4ce0-beb6-fb64d81bcc17@quicinc.com>
Date: Tue, 30 Jul 2024 08:10:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Modify print_array_to_buf() to support
 arrays with 1-based semantics
Content-Language: en-US
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zC1NvRSVq3ZniEpwyEoiO4uK7L2yCLyj
X-Proofpoint-GUID: zC1NvRSVq3ZniEpwyEoiO4uK7L2yCLyj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_12,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=237 spamscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_081047_291362_471FCCDE 
X-CRM114-Status: UNSURE (   7.40  )
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

In the future if you need to repost a patch, please add a REPOST tag to the
subject, and below the "---" explain the reason for the repost.

Having duplicate subjects confuses the reviewers and perhaps some of the
automated tooling.

Also suggest you use scripts/get_maintainer.pl to properly populate the list
of recipients in the future:

% scripts/get_maintainer.pl --no-rolestats drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
Kalle Valo <kvalo@kernel.org>
Jeff Johnson <jjohnson@kernel.org>
linux-wireless@vger.kernel.org
ath12k@lists.infradead.org
linux-kernel@vger.kernel.org

(Normally you send To: the people and Cc: the lists)

/jeff

