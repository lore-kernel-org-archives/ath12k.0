Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7921CD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 16:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=636zevgSUP7eV8GIfmQOjX+47o9fQKiRz7Vou/3XiBM=; b=NBkpBLONmwJc8bh2vCqMxvLsg9
	uE2ZMu7HNew4aUWNUoc70lnRf5rb6oOxbaPfB6OTEDBPE458Nmrn8mJGf4GKQu9WUri8zPOVyYM3l
	0ezGNDwqnwX4OlbRe8zpqzAi+KY06WuURs6/uosBk13Q/bS+uZnHK+k4enk6aFodPS9yLTHQmzbQn
	rKkkwvL7txYtJDSLhlATqFUq4T6FjOfXIn7GTMGz70eCuOFDh3fYIVV4Vr7QYD/EKu+VQm+K9gldL
	UGSYjnLvfx53wlfUifVcDtzmSW++g8f7ISfdjhSfXxMeuKX07gALBDujNu1a495PFlJZtC9PXqphb
	khFvPTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsRK-0000000EhDM-2jGx
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 16:17:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpsRI-0000000EhCw-1qLw
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 16:17:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42SBKxOu004762;
	Thu, 28 Mar 2024 16:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:from:to:cc:references
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=636zevgSUP7eV8GIfmQOjX+47o9fQKiRz7Vou/3XiBM=; b=gL
	PJbx8C2bBGwyE6XhowDzxENX6p/+f121vufT3BmoWmCyoc/w7w6WFeDUske1ldF2
	mEsXkJpUohMN1O2M0kS8ZDTGmpZd+q9osE+kz+VTvBstS1LicXUw3xNLzCNSYJH4
	T3KbiV6HwjFI7gxQ+o+jH9U+AaVH3xi8MhHFeS0QRFeGwTp5O59i4TwZb1spj+7u
	Rv0/vxtMazpUHDmzYxES2cskUk0GnhpA4sWUSqgPM2ODTLgUciGbHffBl5O59dvS
	4C7R7epkBw7rwH19aRY1Wk1wKHse2GcDFpR/C2tULrPwGICxzGrnbI501KjwFEl+
	v3j6TiqVJXO/0ZgNLlEw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5580sd60-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:17:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42SGHClo014863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 16:17:12 GMT
Received: from [10.110.124.221] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 28 Mar
 2024 09:17:11 -0700
Message-ID: <e0074686-0a1a-4bc1-9d51-baa8e8348131@quicinc.com>
Date: Thu, 28 Mar 2024 09:17:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware
 channel capabilities to user space
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        <netdev@vger.kernel.org>, Jakub Kicinski
	<kuba@kernel.org>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
 <20240328072916.1164195-3-quic_periyasa@quicinc.com>
 <6d92d0ba4a8764cd91cc20c4bd35613bcc41dfcd.camel@sipsolutions.net>
 <9d5c2f9f-19b5-af4d-8018-1eb97fac10d6@quicinc.com>
 <9d0f309da45ae657cd2ce0bc11a93d66e856ef64.camel@sipsolutions.net>
 <14b739c9-18da-0d58-b58d-cccebc505950@quicinc.com>
 <3f61f18fbf3372ff88da54cdfbd309e74b2aa4e9.camel@sipsolutions.net>
 <2b5fdc14-85f0-48ba-9797-c1f43ecab86e@quicinc.com>
In-Reply-To: <2b5fdc14-85f0-48ba-9797-c1f43ecab86e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _1EYwoUDPRrsJeZpDzDPddA9IPYUZb27
X-Proofpoint-ORIG-GUID: _1EYwoUDPRrsJeZpDzDPddA9IPYUZb27
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_15,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=767 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_091716_662816_34204816 
X-CRM114-Status: GOOD (  10.95  )
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

On 3/28/2024 9:14 AM, Jeff Johnson wrote:
> On 3/28/2024 9:09 AM, Johannes Berg wrote:
>> On Thu, 2024-03-28 at 20:40 +0530, Karthikeyan Periyasamy wrote:
>>>
>>> Can you point to any attribute constructed in this way from kernelspace 
>>> for the reference to explore more ?
>>
>> I don't have anything directly, looking at the code finds e.g.
>> devlink_dpipe_entry_ctx_append() but honestly that's really quite
>> trivial, it just adds that new attribute while iterating whatever list
>> you have.
> 
> Note that we are trying to maintain the same structure used by the current
> wiphy global advertisement since we actually refactor and reuse the existing code.

Need to check myself -- i'm thinking about the interface combo information here


