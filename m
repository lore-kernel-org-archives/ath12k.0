Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EDCE77197
	for <ath12k@archiver.kernel.org>; Tue,  7 Jan 2025 23:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/OXOW4heDzfbMQ07OQGYi/eomE9Ei0nXstNi2ePc7UQ=; b=ZQEyQXOri0kQyV9pMNRH9JKTgt
	+JUlKLPur3fTe17euDydYJzgxC9CPQs2X8g3/TGEK2zIMFgGSPgoBiJp+1fawUsSZKl3Aj0hwp5oC
	dVykU8e5TMiOnnYsZzzJyuys+v6FH6l77EnO0BlY7vY1P+CPqzTrZP3Rr3pZ0yTjaFijM+KamjU5J
	jGJ5P/j68806bBab6Jz+NvJ3G6k/V6R7lDR8ekqljlVC0uHeSZlDDdlXo1fyIo2JkQx8SA2jGMOnJ
	O7uV4bAN8rtRIbcjpl5yvsfLIGGxmXqjxOEgo1hnciZWLOUVLyhrAsarenXqYg0PJXUy5bt00xXKh
	YqPfRbaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJ9i-00000006ZSm-28pC
	for ath12k@archiver.kernel.org;
	Tue, 07 Jan 2025 23:38:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVJ9g-00000006ZSC-1HJs
	for ath12k@lists.infradead.org;
	Tue, 07 Jan 2025 23:38:37 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507K2jdH007104
	for <ath12k@lists.infradead.org>; Tue, 7 Jan 2025 23:38:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/OXOW4heDzfbMQ07OQGYi/eomE9Ei0nXstNi2ePc7UQ=; b=lt7H71nr5ZlkxQgt
	42qwhGtv8DmB1Xjacgcnx+R4Y/ICH0dWBpNhdWLo/9PfVwPeLpaq2XM/ObDp6i6u
	y3nb75lnu1gxF4lbSsYprXqWw55iGOaLQtUprM84qZ1FZVokDwk3928XruaXGhA9
	8jqnaDmsDXE4LRp6GaxSw3hRi/TyfKgEEyxaGZP4/Jku4cmFXCtDqCWzHPC8L3mx
	Wph3v/OF+DOTcknmIuNi9ZMo+kd0+Ricr1Bp+DZil16D2SpuFB7a9CCypzyJjyv7
	dgp7ODf957WqHmlcv35roI9EcSjBEkDMOr1kjrHO9kMfljgNLNxtwNmoatmfwts2
	yRjW2g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44108fj6au-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 23:38:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2163dc0f689so99294705ad.1
        for <ath12k@lists.infradead.org>; Tue, 07 Jan 2025 15:38:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736293114; x=1736897914;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/OXOW4heDzfbMQ07OQGYi/eomE9Ei0nXstNi2ePc7UQ=;
        b=MXi2RBgolsOdd5B/tPu7KOVK9x2CVJcCi97TT4gHRVILxLcp147A7PTNiyIsdUfd7S
         z95wJYVRvB1cynW1dB/msDZ+yAJrkxyeVbyQGZpBcubu+sq1GNmtbk02mG/OPaHVXFuG
         QppLkbaOhSLN0JXsVg5lHbpv1BSkVdnslqNGgTE0aFNJ0X7fIlm0h02b4jrOyweD02mE
         yFZPMRJhirxVbQmMs5bB+IhoN9siUp1PdTKj68iybZZ4tqtTANdV7xLsb7LSLmZh8QXl
         ELd9BHWjEyxwkaQp2cL1mUKN3h/axLmvMsbW1D7t+udf6m2sppUg2WpKLnGN1AwTzl00
         8rZQ==
X-Gm-Message-State: AOJu0Yy5Aa01si6IQLY4dcUk+r4mAEXrF6WfTfGefFFsyqFgNa1aY1vE
	y4iwTsW6FcxiLtLueT1rgSGBDffasZeu31EPxPs/XSqflU0pFCVofM0ExbsNlf8hSkerVQb+Cnt
	9mNlgabeS112N76/GWcRFEasIY8iB3q/dWJPLXRTkNdjfeQAnN2KACfeMRWoE
X-Gm-Gg: ASbGnctNc97nOcN2E9OFqMyd5t9e2Gj1Khviuzs72Im2lXC6lfzA7dNpokWZnbAy+Il
	YIBEE+lHd1oPKfGsNLHOO/dsQrd/fZYcyYveirUmU/LuSycHrnVteFgABAu7h+1PKjbnZVZaLO1
	MTiKVWYdnyQ0fxfGF5+Mj+wm/sPrrFG6FKn+a/KvT39VWLCoIJ6cGY9p6M+/2QAaFtlxlAACsJk
	zBgVmJq6W7Dx3G4smhEGUZjqKQ+ZHKgrxuysgpIosMuJQZdaD6n3AIsOCtCe+7+K9zMOmhwb+WA
	gCNPsENb/zTEtUa1yGXFfUMaS84bCSw7VQuKuvy2efcpbtCNtg==
X-Received: by 2002:a05:6a20:244d:b0:1e0:b5ae:8fc1 with SMTP id adf61e73a8af0-1e88cfa6852mr2133058637.13.1736293114006;
        Tue, 07 Jan 2025 15:38:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYieOQL5DVKrFFboGaDv3rB+c6tkPaA2Lq7M09HgpEjKdIDfk9vyvwRMmgQFREUOCgiV2ECA==
X-Received: by 2002:a05:6a20:244d:b0:1e0:b5ae:8fc1 with SMTP id adf61e73a8af0-1e88cfa6852mr2133031637.13.1736293113626;
        Tue, 07 Jan 2025 15:38:33 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad816305sm33823525b3a.31.2025.01.07.15.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 15:38:33 -0800 (PST)
Message-ID: <c776b5ee-0e25-4d21-be21-dd318ae33d1e@oss.qualcomm.com>
Date: Tue, 7 Jan 2025 15:38:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: Support Transmit Buffer OFDMA Stats
To: Kalle Valo <kvalo@kernel.org>,
        Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
References: <20241128110949.3672364-1-quic_rdevanat@quicinc.com>
 <20241128110949.3672364-3-quic_rdevanat@quicinc.com>
 <87jzb6flwz.fsf@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <87jzb6flwz.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: E96C7FfjrcMRPjuWeU420Z7Qw0RjiDjk
X-Proofpoint-GUID: E96C7FfjrcMRPjuWeU420Z7Qw0RjiDjk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_153836_368683_A2B0196F 
X-CRM114-Status: GOOD (  16.34  )
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

On 1/7/2025 11:45 AM, Kalle Valo wrote:
> Roopni Devanathan <quic_rdevanat@quicinc.com> writes:
>> From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
>> +	len--;
>> +	*(buf + len) = '\0';
> 
> Please avoid pointer arithmetic, this is simpler:
> 
> buf[len] = '\0';
> 
> Or should it be just 0 instead of '\0'? Don't know which one is
> preferred.
> 

well my take on this is we have a lot of similar pointer arithmetic already in
this and other debugfs files, including all of the scnprintf(buf + len, ...)
calls which could be scnprintf(&buf[len], ...). And we have existing instances
of trailing comma suppression in:
print_array_to_buf_index()
ath12k_htt_print_txbf_ofdma_ax_ndpa_stats_tlv()
ath12k_htt_print_txbf_ofdma_ax_ndp_stats_tlv()
and others, all of which assign '\0'

so this code looks ok to me.

that said, while i've been reviewing the debugfs implementations I thought the
code would look much cleaner if we had a wrapper function (or macro).

Note that the input to the current debugfs functions includes a struct
debug_htt_stats_req *stats_req that maintains the buffer pointer and filled
length. what if we had a wrapper that took just that, the format string, and
the optional arguments, and all of the pointer arithmetic is encapsulated in
that function, rather than being open coded?

so instead of:
	len += scnprintf(buf + len, buf_len - len, "some string"");
have simply:
	ath12k_scnprintf(stats_req, "some string");

that function would extract the buffer pointer and current filled length from
stats_req, calculate where to write the next string, call scnprintf() or
vscnprintf() to write the string, and then update the current filled length in
the stats_req. That would eliminate all of this housekeeping from the callers:
buf + len
buf_len - len
len += scnprintf(..)

/jeff


