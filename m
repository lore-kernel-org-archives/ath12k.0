Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB278CCF9EB
	for <ath12k@archiver.kernel.org>; Wed, 29 Oct 2025 23:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4+uOHxx/CZtpzp2jqysFqC7d+xx5p1LTxwUnQLXfhs4=; b=YI95ztb4oNIT20n8peaiwi7xwH
	j8VNHC5Tcd1adByDCMtciMulCNEkV4L8GXEAnvVLH3fdSAGIIW0p+4URBQ3ObbPdV3XipY2YVEoll
	aWKI7RkZrWHv4Ik3pVtcAM1sc64TDwSSE8TqLo0IGQE5XCznFlx/CwWSMePcVKr9QQkP4L1vQbj5g
	lj3Hvr4BXLtBM9ZHQkfgRQesaMbLb5StS2zmvlvgDGy1HLMUwdc3mixzBsqCt7EuGk8+7ZcjcLM92
	ZlqA4dUd7kzSUhLW8gD18rk4NxwI3w8aLDhyvf/7dQPD5zfzT8EDABnwbUqXc7I9rysF8uPogk+yT
	sqChd16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFQB-00000003EXb-1mFu;
	Wed, 29 Oct 2025 23:17:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEFQ7-00000003EWw-3zsN;
	Wed, 29 Oct 2025 23:17:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59TMfaOq816684;
	Wed, 29 Oct 2025 23:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+uOHxx/CZtpzp2jqysFqC7d+xx5p1LTxwUnQLXfhs4=; b=n/0gix/6HBoRA1/H
	uucWsAHsUwmXGKTF0gqLF+KatbKhHyNXPHWvePiW2FnkEMsg2QI4JoMoudqFkT6q
	y6ipY74TKxE9yRAsHG4GygjOEjYpxxo+U2AeqIyz0U4Z3G1GDm2ePABSUCxCDIUc
	aeSrVyFNWNY65qV0ZfH37/saVAYBH6IopeKdJe8eL6YlRnPZYVZVSW6IMxp5M8qw
	DG7Q5SElE9Dg266q7lMMfC5Vqy0B2xYqRiLUGje+WWTKbAFNhV/ZkFfddHDpQ0Y0
	f595Iub8WTfX7Yz50f84pfe3wKNfPF1MKBcq5+tQyIf/G556Jw1KKNdOH8xlVK2u
	hsm5Tg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mxghj1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 23:17:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59TNHWbj009320
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 23:17:32 GMT
Received: from [10.227.110.158] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.24; Wed, 29 Oct
 2025 16:17:31 -0700
Message-ID: <fb0a1ddb-af24-47f9-9d75-0a8f2e346d81@quicinc.com>
Date: Wed, 29 Oct 2025 16:17:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Aditya Sathish <quic_asathish@quicinc.com>
Subject: Re: [RFC][v1][Design] AP Architecture for Roaming with Wi-Fi 8
 Seamless Mobility Domain (SMD)
To: Johannes Berg <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <hostap@lists.infradead.org>
References: <fbf4209c-4fd8-4047-96d7-7fa34d9ba44d@quicinc.com>
 <c618e0e8fdee9f7aa2628aefdf2dc04c48e6e9b7.camel@sipsolutions.net>
 <30403bb70a2a017c90b1d4a5a1a07514bb670822.camel@sipsolutions.net>
Content-Language: en-US
Organization: Qualcomm
In-Reply-To: <30403bb70a2a017c90b1d4a5a1a07514bb670822.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=AuHjHe9P c=1 sm=1 tr=0 ts=6902a08d cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=90bSTR2FKvGNHqSoVjMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: reMKEsaA_KDeqELMJJGOvr-Fu3m-V1lJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDE4OCBTYWx0ZWRfXyNriNx8p135C
 IMSEyk4OjOCHf7rrAtj4gPdoOfwe1KlLPJDjVRLDgnxXi/nH2PC32dJmvInJKYU3f4yE3RyvKfU
 olTYi/Q20C9DVhoNTn/+47CFVPzgEJ3s10ymKRPXrFXlvfzRar0cCPwVKnTWAh14Wq3zJc4n25H
 LWj4OwnrHQg2lRBbH9C+qllQfTiGKpFxS5fIToYVt4vNPQgaHjwjAQd+2c+cI46N+Bdfc257Q4/
 i2MRjfk+9N8znd577xWq5s7AuB2LJHlOs1x0j2Z3FcQNiTzKR6krg/ocdTUvDkAWunFTSwpmxOP
 VnKyvKKDuvIMgsbMKQ030BVyvFvjdtuwe6lLWmaXUW1jPcCG4SkSSZJbHvTkG+Hsr6Ob4Zm/oDe
 0nrv5MiqE6n1hMVcWxAcAy1s9AUcxA==
X-Proofpoint-ORIG-GUID: reMKEsaA_KDeqELMJJGOvr-Fu3m-V1lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-29_08,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_161736_152692_FC4CCEDA 
X-CRM114-Status: GOOD (  21.71  )
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

Hi Johannes,

Thank you for your response!

On 10/12/2025 06:51, Johannes Berg wrote:
> Would be nice btw to get feedback on the NPCA stuff I posted, now that
> you can apparently talk about UHR 😉
You should be hearing from the NPCA team soon regarding this topic.

> I _really_ think you should _not_ design it that way right now. To the
> point where I think I'm going to just reject adding that to mac80211 at
> this stage, unless a real need can be demonstrated.
>
We understand your concerns on offloading ST Execution and inter-AP
communication to mac80211 in the first draft. We are in the process of
curating more concrete experimental data that can highlight the real
benefits (and possible shortcomings) of operating ST Execution and the
latency-critical inter-AP communication within the kernel space.

Until then, we intend to continue with hostapd-managed _non-offload_ ST
Preparation, ST Execution and the inter-AP communication framework -
handling inter-AP messaging from hostapd directly through socket-based
communication and processing the SMD management frames within the current
architecture of hostapd (extending on the FT infrastructure for inter-AP).

> A good part of this argument - "pending management frames" - really goes
> back to hostapd's architecture and single-threadedness, but really I
> don't think "hostapd's current architecture implies more latency"
> implies "we must put this into the kernel."
>
> Continuing that thought: I think that hostapd's architecture currently
> leaves a lot to be desired, in particular around how MLD works, and
> obviously, at least to some extent, being single-threaded is an
> architectural advantage in hostapd.
>
> However, user space also affords far more flexibility than kernel space,
> for example some things could be written in rust (with its "fearless
> concurrency", which I can attest to), split out to a separate thread or
> process, etc.
>
> Anyway ... I guess in a way I'm using the opportunity here to lament the
> lack of architectural work in hostapd which isn't necessarily related to
> this, but I suspect that had hostapd historically had more architectural
> flexibility we might not even be having this discussion?
On hostapd architecture: we have had internal discussions with Jouni and
recognize the limitations of its single-threaded model at least in context
of SMD roaming. We are yet to identify any features outside of SMD which
holds a critical latency requirement. As such, we see _full_ multi-threading
as a significant undertaking without any users of this benefit outside of
SMD (at least at this time).

Given this, we are exploring an alternative approach — introducing worker
threads for low-priority kernel events while enabling prioritized handling
for sequences like ST Execution and the inter-AP messaging in the main
thread. This could offer a tractable path to bring multi-threading without
having to do a deep-dive study on the impact of parallelism on existing
features.

To summarize,
(1) We will defer offloading the ST Execution and inter-AP communication
    to mac80211 until we are ready to demonstrate the need. Until then,
    we will proceed with hostapd-based ST Preparation, ST Execution and
    inter-AP communication.
(2) We are planning to explore the introduction of worker threads for low-
    priority kernel events while enabling prioritized handling for
    sequences like ST Execution in the main thread.

Regards,
Aditya

Regards,
Aditya


