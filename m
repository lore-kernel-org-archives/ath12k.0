Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B144EE9A047
	for <ath12k@archiver.kernel.org>; Wed, 18 Feb 2026 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=; b=mXQARKhi1hm8KpC820NAhJQsPy
	z4HBNsvzYLeFuo5CJYBFmtdfIAl/IECLTe+KMEZ3vCqfU7Hv5g5c8ijOQWNcRAOBvdJ9xUQmlGaoY
	Ax8aCgOREyCHtTRQ8wYb4qdiFPCbo0uWctCHpIC/2jrH9CySMwYQjGyzV58kjX6o0eXpzQYUYi3Yh
	mDfcJub9mIzzAuKeasYgygrojJfRrEP9mmB9jadoob2ZIaCEyu2H8DB+q082FgPaaoGLi1Q379GUB
	z8E2jyCcvVntuOjiIcQZTS88kAiGIX7c6bd/RE3n+UQnCpjYlCivudL0XANPzHwoy6nb0FtGRA7dM
	BeJ7F1Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslqk-0000000ACND-1mIK;
	Wed, 18 Feb 2026 18:00:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vslqd-0000000ACLf-12WY
	for ath12k@lists.infradead.org;
	Wed, 18 Feb 2026 18:00:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9ohl62784620
	for <ath12k@lists.infradead.org>; Wed, 18 Feb 2026 18:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=; b=MkXkkUXEWW/YoLul
	fLyS6tzl1qWnX+rPDYn2snJDzmzNC1SAaR0FvubdOJTfpa7lee+JOrHHSCgx32h2
	qEy7VTfVtTwyX7pS8qdKu/YjUo56NhRHZz88gZrv8pGHc95Imuq/hB6pfVd6NkNE
	0ENAUI9r0tb7PBeTQMeu9bd/QA6cwVzoP5Cm2lcTN/65I8ceQ2u27DYYSk0uTN7K
	FnAKP0MLc+hWD7ZYxv2R0T63M6ngpkJiJlL5Kj1VnKoxvTC20KqWuX+DWWdPFX2U
	uR0SOpA1fHF23v9bzdieZ6rBeEYTFK30Zd6fnff6C7SUoi8lqDvQuzawZbbdSjdW
	miEcNg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ccyrk32jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Feb 2026 18:00:26 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d4c7afa9e0so2908138a34.0
        for <ath12k@lists.infradead.org>; Wed, 18 Feb 2026 10:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771437625; x=1772042425; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=QXiQRBRsvEp4Ho8y5ZS/Xybun/af5jswUkK0evNyX73j1Wpt6DCa4LiVkotONLYVP0
         sErhgOSH18SVdBzWJP9dc5hnHxufz5EcpgpAqTRDqGCK2Q5R0FPckhk/2TcCenX/cD6M
         xnLXikkyqVcr9U+eRYnFAaqTU0xkiVF1F13Pa6yw5/pPqwgw5HmBaW96XGtGtPrI4sgK
         I2CoChJAqdRebBRdPlOT2VUb5hkU7WeujrlCfQDDPieMK48TocRGjwQGnuL2hIMTOfGq
         xF9SNxHCzR8d7Fu/eKK0CYGboioN9NTwlSzCa9LqKTbLTPS5QkWS7dN42OJi+q7gpPEW
         vioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771437625; x=1772042425;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gvgZL5fYRbbNaCYDrVwHrqLZUu2F2eOiunykdEYbTCE=;
        b=e1/O6wF9dPmrqjPTPljUj6oS4HYpj+uuFOw3FXKhJAdZwNyxzv8/CFP+ksX7iv7ksK
         9HeGZG0Yv4v26FhKc1SzZev+GmsOGSAxQupZxZw/la2PtoXXG+WK1v2FKEEG9K8zfosf
         WrY/NZhW2wIkLzJgmjpUNfs54KugFunzGLoIBEZRoUH5aOpdL8UFsVnDkuEvm7/ra0oA
         OKxoRgc6MWyTF8BULi3Q8YxjaOaJoWMtcP9wlYPulqTEUssnzJoABQMg7HiiYboRScdm
         THnDureQol1SDT3ZE7xQyUI+L+63imYRx6iNn7I3W1hfesNpaWBMT+P9N7f0ThLJ81oY
         UANw==
X-Forwarded-Encrypted: i=1; AJvYcCUlaCIbeqJqtzTPZU1Z+2kFuAZJ0zVNy5BKA6j2zygzMpasZAd1q+dnTtRQjfkVXfyOF1AwByg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyTkdDkXjZ5UfoOqa6/CnAFwK3bpkiHUdPfHtASmK1hZGC1e+Fo
	3HUiASbJsQkyWuNFwnSgk/QNJHA0iLCIyv0qU+/7VSdfVXki0upE+bRXUYzzDj1B7rHCEO1VvI0
	3j9fj/E5TUFVjkjSPijKDNocFLxiBkZd+0liH437EzlVUMDdhgfbEJ/N+26D1Q2uE
X-Gm-Gg: AZuq6aJzyOp0zTfr5CJQN7iKEVrE0rqCebGSpuDe3MqEGNAV2hNeZ5XsPL8phyJF2ll
	wZUIbdbE3hm3H0h6zOLMgG6h8Q7L04T6IPUU0ulh9A9MDoZt+IwjnxcO8WqeGWLxzlRzZrLYdN2
	H12J/p60GmLqsNZyB5TUhHRkmE67PzAGTtMoZ0Kgy8RsoKyOAvPRxV3HSc1K+V3Mg11LFmYsFWB
	efzIwrKcPyfIDjwK9Qg7eBnApQv9wZZcH+0V2pK9qSrvUDHFjgJfa0VV1w1RKt0++nBQ+XCAza2
	zHlkUvtCPx1c0gCCuv1DlItjY4a8A4xm+8QUW/NF4LVugqd2aqOloSrC7i9NBgGFaSTJsQwY/X+
	l7Fcn9B+CT9qgeEgQJR7+Ii/axKbbCxYTzQ4jZq5vnVCwR+hJfjpsdlBjrq5M2Mziqpwc0mTpYr
	GqtAPXGg==
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105905a34.14.1771437625506;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
X-Received: by 2002:a05:6830:dca:b0:7d1:95c7:f4cf with SMTP id 46e09a7af769-7d5127d2d67mr105892a34.14.1771437625085;
        Wed, 18 Feb 2026 10:00:25 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d4a754b4bbsm17960110a34.11.2026.02.18.10.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 10:00:24 -0800 (PST)
Message-ID: <608ff2a7-775e-46ae-ba8b-9d9c2f8219bc@oss.qualcomm.com>
Date: Wed, 18 Feb 2026 10:00:22 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: qcom: qmi: Fix "invalid data length" in encoder
To: Bjorn Andersson <andersson@kernel.org>,
        Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Chris Lew <christopher.lew@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Jeff Johnson <jjohnson@kernel.org>,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20260214-qmi-encode-invalid-length-v1-0-780cb4e98b0f@oss.qualcomm.com>
 <20260214-qmi-encode-invalid-length-v1-1-780cb4e98b0f@oss.qualcomm.com>
 <aZLcO4kD5fGtLcGh@FUE-ALEWI-WINX>
 <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <vexuybqdbf6wx5dxlcdlcy6lwqmxmzonorjn6x5zlzdpxzi3yo@pcqbxitzed2m>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uN4qhXKHKZhbrZKc2_JyG1rtiaYPSJh-
X-Proofpoint-ORIG-GUID: uN4qhXKHKZhbrZKc2_JyG1rtiaYPSJh-
X-Authority-Analysis: v=2.4 cv=eOweTXp1 c=1 sm=1 tr=0 ts=6995fe3a cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=NEAV23lmAAAA:8 a=vZmAtJSpd1NQ6jeXC_kA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1MyBTYWx0ZWRfX0u9BUZEyii+B
 MUD5VzlJC53qTYBYQljTUU6lxVjwh8Hujqhik5vR+R389WjADe+lafadhcgSOcHwyd+Jp9w2eFH
 1k2YcJLxZEbu6mIGcz2Em2TFDMI2eVx+EUzNqRsAreahbr0Nc5h8t4B8lHJ/CAo1pwsifplBNv/
 cftpjA4XVF1z/PfOYyhqVBS6Qw7CwY9P3nqC4z0fu5DGQDX6Mpx+Mo3RYoHFt5ge1wxkk9D5QF4
 ju4ddS1Ko3WUQ7NKwaM9JhMqlx9dAIb2bI+KQW0Nf/Yo7rlXtPKuBIUmT3rVbVjNMkBjdGkIXLs
 KrzqI3W8HxObvfOkFDSMsaIdzeEeDFtHMMVOwDh6exAuli7CcEtec5C4X0vWzREWMpVGxm9wq90
 cCZyC/nhdWu5NU39LNv30CWyJuo+ssZrbkjaAHAXFYkAicex/pKBKOJ2GVVGZaQeImj01vxkyvb
 QnaKTlBOmP1wz5j9CuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_100027_329722_75C00552 
X-CRM114-Status: GOOD (  13.40  )
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

On 2/16/2026 7:25 AM, Bjorn Andersson wrote:
> It might very well be that the underlying bug is my expectation that
> elem_size should be reflected in the struct and not only in the encoded
> message, and hence what I wrote in https://github.com/linux-msm/qmic.
> Perhaps the length-specifier of an array should always be u32?
> 
> @Chris, what does the downstream generator produce here?

Is this behavior just constrained to QMI_DATA_LEN TLVs?

I'm looking at downstream Android WLAN code and it has the same discrepancy,
so it appears the code generator is always producing a u32 member in the host
struct to hold a QMI_DATA_LEN member even though the actual element size as
defined in the qmi_elem_info array is either sizeof(u8) or sizeof(u16).

Does this issue get fixed if we change the member in the host struct, i.e. for
the issue mentioned (that I chopped off) modify:
struct qmi_wlanfw_request_mem_ind_msg_v01 {
-	u32 mem_seg_len;
+	u8 mem_seg_len;



