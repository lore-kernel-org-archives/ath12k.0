Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313A0C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 07:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4u/s5vioB7slJokzjYeAG8EE1aXJ4GsiGsD2uGu5Yak=; b=dbOkEf5qmRnZJjMf6J5FvuusU1
	ZfKoDKyOtNYlsTz8gKY6jsrqBRgGevTQQreeIVEqtBzosaDvwW3BNss2wT4ITc9Dwb38XN3pWiaej
	kgjOoZQ7hoDB1EvMx7YwYMeN3xbK0rgj8q0Q5aP2D+i1L1AuwBa8YWc9udnWIdJS/VginK8pbgMYq
	0DxLbMUFpGqbSYwsymHyv+OX2zorHgcXmZoyMZ8JKYrYdieqzAnq0gIpD0AKXFYnHMhbe09zHI9BP
	2R0tV7OarmoOZSSYOU51L0bBc3ldvYCFdoVXQWIDWPKZbiIxM/jC6+FvUsE3YISO8mzXzg+3NB7GY
	WXRnpePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAmX-00000008L8J-3zgv;
	Mon, 13 Jul 2026 07:08:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjAmU-00000008L7h-2Y36
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 07:08:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nxxs390895
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4u/s5vioB7slJokzjYeAG8EE1aXJ4GsiGsD2uGu5Yak=; b=djAKuJfzIHL19nS2
	HVyqcGqzIh+2vEsjqbVWPi/+BaLGuFwbkKDfmYRyviOSPwR4O9fzv5GgCiltbl/H
	LX/9iSJON6ebP5vqgKswK38t6HXkFtlC+Nw1H3nhDUqgmNKalO14YgHG/fJmVb6a
	RQxXrgjqcQWRQtIRa2E9DWbfmshd8/p1LPWQO/KvFNj7jd3scfcMXTMV3PouymAZ
	tqCK5o2UiVGJ1N5z9CeOaHnoJVpzriFs/0wUXCTD7MFcezCYT0JbQgkFpP9wDnII
	PwiUoLADrcpV1nuWOWQY4H+3eS562QwWimmx/BPRjZcz9MZJ0N+In+wYRY85OJSM
	KbyuyA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbf0gms6n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 07:08:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so3960102b3a.0
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 00:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783926525; x=1784531325; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4u/s5vioB7slJokzjYeAG8EE1aXJ4GsiGsD2uGu5Yak=;
        b=JfvuGtfHx/O2y+l33xdWKfKKu9MEmaeGK56SzNHyTZ24V1qS69i0El2RwN5LcepgmT
         x+xREyJUwnGfJnoGsodMTR/thVHc/asvdOLoU+n2G5z7PdXB1ksnptlp1wrM0kk0LsMO
         Zp52LznpR2IDuoyASPFY7Zn0Io2pDgmGwn0dJ85Ky/f5LBTuFwfvMFn62jJuyr3QO+8I
         tk2aQW/colXUcP0+gSmwQkw9UIHYYQebdKOfDMfg0DQ/yIsLzu5NSBgiuWkx52aksie1
         9RvbgarpwCmrPYRJzWE45PY0vvu9DLT1lqioEoA+MLKkBQUL5GkhZiPDL4hSyo5pirqG
         O/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783926525; x=1784531325;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4u/s5vioB7slJokzjYeAG8EE1aXJ4GsiGsD2uGu5Yak=;
        b=AiNcN8qeXO/Xeo2xGWz2seujX2STP1aqOmGFFnbl8bfEx5KLPqvSmsYgRtCiQese3n
         +gP7/FBN817q8no1FMx0eSeFjDwVvuc/fB78sXf44M6puSYpn+PqiGETs99N7Qh77aqm
         WDj9L/rsd8PiEj9DbWJNIbx/Rb5dGlgcSamyOKHyOq1ZN1lwrKSW0PmNpTMdhzjj2xHh
         ThEM2kZDRmQpbfu5ZnNumDy+8QotiXJRxIbB6PdeC+3mSoBVk+vglIB1HDiFBX2Rc4Sm
         Zj7eqs5KnNutVYsaLfww3bg1eSHg8gbjJMyjd3ZXY6WIFyVOquzMxsl24Xc/Aq7F0Se5
         9SFw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8DQu8KqPUWRTSGwkIqtoIXvUXfy8QD8Oq+4xFyEz8vX/2nEZleI2De+sL1l+UScAyT44aZTk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4XxI4h6d8SqYXzSG9CgmT9jgtnri6bDaoYkL/BCr19et8mWZ
	LHVda8QlnOfTk2Q6csMdaCazeiiGz5kpKvIE8U8IuXhWg+RU1MQiG/Gp8fqN583HD7irQb1ennq
	Kj5tQwctWOkIbGltGzLUbxSLAqHT5XWfe4tMe5irGyNz8VQcy+LVQgialEOVwcJsSnDA9tWkK
X-Gm-Gg: AfdE7ck23r8I7PqOaAv4oCS1v2+pgdch8y2Ak3brulnzQR16Woi038BLioLAeCjK3im
	t/1T2hRlO6ca4/a2h4+LHc8KEo5NpD2e4bUVF/fBs2jd/FkeZnAfH///wHS+W0kfa4W/UlJyy6P
	+SxlvpztxvkPr6q8LZmuUcr5sksrNmiZXbdE5B5uxvxzBl2nEFKcTDubhpHA5gDXc4Ct/mXFTGn
	pfoaVUDjLPtaqGRGiUYdZjQP+PgB/2f6hDQxmwuEzs+cjoBiPXADmLVHEgKGmup76EfgJyvuTKW
	H4z6y2qZZz0WasXNFJcsQki4Qixw1LIlUYJmTLN+MbvJpDxBr6MIn8fj7HfFYFZ/Ozy7/LyTB8j
	MHdRGmlHQn7SlW0x7tL66ZqGZA/ptF4gaM4LqUruN3hl8tziHxcU=
X-Received: by 2002:a05:6a21:4593:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c110a10104mr7293970637.50.1783926525327;
        Mon, 13 Jul 2026 00:08:45 -0700 (PDT)
X-Received: by 2002:a05:6a21:4593:b0:3bf:c49d:9183 with SMTP id adf61e73a8af0-3c110a10104mr7293947637.50.1783926524857;
        Mon, 13 Jul 2026 00:08:44 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm69540823eec.30.2026.07.13.00.08.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:08:44 -0700 (PDT)
Message-ID: <3c5a3c56-78d5-490d-9b14-c1100c2c0dcf@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:38:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Reduce RX SRNG interrupt timer
 threshold to 200us
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Nq3htcdJ c=1 sm=1 tr=0 ts=6a548efd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=6v9ovjmckxnE5_8N7CcA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: P7W2mlPG7RMvyic9bdzts-xCaxOFf3ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX4NCTR50awSsW
 qJXbBC730BCyU8JVtqzSiAp0k/2L1m3Ol3h32hMV8lDBa/QXR/O6A7k7NuKfU0RVvVGPz5DqrxW
 XuGmzpqABUPXZjcqNaAiIgkEG3pk3M3hB69YS5FqKk635DFOtCB2CuLgxdcSHGGqjYqZDDoatSj
 xJiTm2Kj3JgX9ayvCkFxAKgyRy37isfJlYFxQx4nxLOehcn4stsu6BB7UConZlo+11uYqsu04xj
 3cMk40iQzeSXZslv9Dz0FkrjV3eUyywY+mlS/1OY6yyM9hljjlH5VqT1GDRpdokgRNDBxu7Pc7m
 aWTsxZAf9WGQs/rUjwuv2Q9wYZfRTsZImQafaBRG/RJcCi/OzW+v8eVLIxKzrLi0KXzYFPBKmc3
 XS9rs0q1WY4OSWFRZWJdXjwfANQMzssJUg8eikqn5s9gNxYGpces8VjJ6sIjpwAgqNDlYgP8FXE
 Sf9nILUXqSKWj9GKcjw==
X-Proofpoint-GUID: P7W2mlPG7RMvyic9bdzts-xCaxOFf3ga
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA3MiBTYWx0ZWRfX5SoNsaQkk2rn
 l+nY4pjigO6se9rpcgzju2UJ6DU1qQbTX4uRYa+HP/EADP6EutGN+T561Z5Tvv9CH4Ydk0NIZBs
 6RCXXujECAG+u/KQBCRnURu3AJlv8DE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_000846_674712_A01C07BC 
X-CRM114-Status: GOOD (  11.81  )
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

On 6/22/2026 11:53 AM, Thiraviyam Mariyappan wrote:
> Currently when RX traffic is low or intermittent, the RX SRNG interrupt
> mitigation logic defers packet processing for up to 500us via
> HAL_SRNG_INT_TIMER_THRESHOLD_RX.
> 
> This causes excessive RX servicing delay, leading to increased end-to-end
> latency and degraded TCP performance in low-concurrency scenarios.
> 
> In single-client single-stream TCP tests using 5G EHT160 (NSS 2x2) mode,
> throughput drops to ~400 Mbps DL and UL instead of the expected ~600 Mbps.
> 
> In addition, UDP UL end-to-end latency measured in 5G VHT80 (NSS 4x4) mode
> increases by up to ~48% (~570us versus ~270us) across frame sizes from
> 76 to 1518 bytes in uplink and bidirectional traffic, indicating delayed
> RX servicing under sparse traffic conditions.
> 
> To address this issue, reduce the RX SRNG interrupt timer threshold from
> 500us to 200us so that received packets are serviced more promptly under
> low-rate and intermittent RX traffic.
> 
> With this change, single-client single-stream TCP throughput in EHT160 is
> restored to expected levels ~600 Mbps TCP DL/UL and UDP UL end-to-end
> latency in VHT80 returns to baseline values ~270us across all tested frame
> sizes. Under high RX load, no throughput regression is observed, as RX
> rings are already serviced frequently. The primary implication is a modest
> increase in RX interrupt frequency under low traffic, with no observed
> functional, stability, or performance regressions on tested platforms.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>


