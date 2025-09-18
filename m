Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570FBCA1013
	for <ath12k@archiver.kernel.org>; Thu, 18 Sep 2025 16:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=; b=KimESD3g/G8RnWT/tB2bS2TozK
	uZwwyeDXODFl8yj2GljsxHE2uOo6sIP/KG5SIrLe/i3JMwHQd18TL5KRazC9nZPr/Xyssz6qIpCE/
	czh9IUVNcWDPrGAnqKU6TYE1/Rr4W6FW5Odg+84r6SR3VafYHJrSuMzOb3xjBWgLR1XaGp8V3Khho
	sE9LIMXeHTE3o10HWQLMaggK4s4KwnKan+ruwz0BG5PcfL56VygAxnmPU/fxLbNfEYtmUnyojSdxF
	NlNyU6N52rAcWGLSKR0GneO+/xCIHAf+jqfNl7i/QPQFG7F8tgXpupEDmpNOfeWvNV7XSXP1e5yzY
	uhlYI4iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHXZ-00000000dXy-0QeF;
	Thu, 18 Sep 2025 16:31:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzHXW-00000000dXc-2XvB
	for ath12k@lists.infradead.org;
	Thu, 18 Sep 2025 16:31:23 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IAoXsO032414
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=; b=ES7HGXdQdiFxaJtg
	k2xDRMr62o8gqivC38tQpTwBe+ZOt1P2zvyqNsevxfkNhaIBpH4oc2G2/boJue72
	ijz11mbcgLUV+vnu22JUSDW0U2RbLYxVuu1aZm3sLJivpHUSz4t/ARsCpSUjIrN1
	DRqSzYpInBkK3E0aLzlcENMpSNE70PBX0tdVbFH2Gqq6fv4qzRw79kZ+c6I6BA1K
	7pDsUxQEMt90/FdLXUTxhcerWuyvAfd1dJv5fqMIZZqgD6hrFwi07SxJ/nZiKnuF
	M+4LSnv59bV5dlVuf15ToLzlfhcCmUiHWB30F+EnwZV7SpGW4l7yrE+S6s5CoGOb
	jpveqg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyq5nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 16:31:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-32eb18b5529so1082112a91.2
        for <ath12k@lists.infradead.org>; Thu, 18 Sep 2025 09:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758213081; x=1758817881;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCwN4UWf/qO87rnIbDuNnYXQZL556aOSgTuDK2FYCBc=;
        b=bkV5D7ZTpIme8wdLisQReVmKj5ERWn4vnN/CY793juuS6Hia83IQBYjVhDZfQYPz4h
         sdoc3No5NdaAJLPPU2Cl2xRbZHp21QvysQLwiD29lZR49e5dZFWpIfXgEFxjecqBiYdg
         XDjqsqNYn9U76la2TtOCOidnQFBqwEXgkOAJMKKIBg8AkJVWGTXDLM81kvdbJBDbUM/O
         3pQBvTwaMpTlMcGsjvtIbKl+MNzIe7i6DIsCyprQmJYX/2Ts9oyMnOSNxHB6AGOhabZy
         vL7ts0aVZDo/64NtEckfvWSBFR3ZpnR3haTepL3PeahVqkOWmK+aXkqhJaV8gP3PNLTC
         Gwww==
X-Forwarded-Encrypted: i=1; AJvYcCWIX0MXUF8pFaKna5hyVSLoH1xuRZA0uDykQL/1CSExWp9mgZ/18agJR3ke3c9wYf48OTO6acg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHkPdiiSZI8IxxGVdlrnEciht7e9Ce/lctuZjC/XyBxiogwxqb
	7DFrt84CQV3d5DmYFdbrebHEURxcIOnRMCcUkXbB7qi1xwm1OJJZs+qFJFdafEVM79cBhzsKWwl
	tK8iQ1W9mRn2F9nzsxf3slMcbEYW4hhITgcAaS8sf0Wx/trdtFg0iI09NGDA56Sri
X-Gm-Gg: ASbGnct7eEgMesHQ0Kz2ENKL9ZoowNUO3rlCzEBzNteK2JirYcm74ebHX8g8yh35xgX
	ooNWMZ6RaPD+WY6KJscekhWxMmAxR+FHEOMoC3JWe2L9Omczvl8Bjg/mW3ADI20wnfkJrULrSi4
	tcAwtXyCnbShaQ3T1V65YqnR+6kWTqIJjo8+IqEm504Kp1EPsDxQSnfoPLJv8burCFD9VGpUfd/
	qIKgingadk69tHK6pvLk+1rKDZvUAQ2p9TTu6PEvvBWdWmQvq2sh1FvXwSfjhpcQ58Rij68lJQ0
	1wC/SupL2gvuJQnlmTm/OnoKybe3Nhns9itttdXLZYVwCs95r8XrcnzvVew51xgHBVJ2Cte87vd
	mmK6fAd/5LWkdnZHXBMru7nlz
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr9571435a91.15.1758213080969;
        Thu, 18 Sep 2025 09:31:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5Bzu9IzjWAIb1ykdrkuMpLZlLBm0S0xGZhC2cExjcG46jsKIRUC4NyJocWI+6wpsHTHQ7Yg==
X-Received: by 2002:a17:90b:1f84:b0:32e:64ca:e84e with SMTP id 98e67ed59e1d1-32ee3ef7071mr9571379a91.15.1758213080410;
        Thu, 18 Sep 2025 09:31:20 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff447060sm2685889a12.53.2025.09.18.09.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 09:31:19 -0700 (PDT)
Message-ID: <e8d283aa-fb73-45d6-a89a-54ff31f205c8@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 09:31:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] wifi: ath12k: enforce CPU-endian format for all
 QMI
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250918085406.2049559-1-alexander.wilhelm@westermo.com>
 <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250918085406.2049559-5-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc33da cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=msdzb5vn4zVyWyR8mUoA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JO5godkkEp0FRXjYNp2JgR9LRXPeS1KY
X-Proofpoint-ORIG-GUID: JO5godkkEp0FRXjYNp2JgR9LRXPeS1KY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3KYDxdNkNClZ
 j+pV3yGQn+Kypf+bF0GGc17oboA7GcUKRs+mmzCvMj1bvDjUgb+wozRYr7Pr6uLCMNXTGcpzrnT
 xeZXNwx1ptEjxqp75S2Xes5cjs5bzzoQOc1RRgeL1DQ235pYLPdWXI1KsOd1Yl6Yr2kYIQG2L8H
 6sQuaToyA9o2aDLRv6iQuo8a/pW/V7ZUgm/AztZcxEc8LtnBAwSrDikNwGOcp0DhOiVD14cff+S
 gSRhugshrnONyVIffMhip9N/V7+VgjAhMsHkFmrT3DOJTz7nLT2Eyi120pNh8XTAPY4jNqttUda
 akgaT03ClFEIJNwEFsV5Zg0m2GDxhFGxqvlX7IzNnTa6v52/il3biww3np5TvCxl1tsU4fNTiki
 Hxfn9eSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_01,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_093122_657432_CFBF0C16 
X-CRM114-Status: GOOD (  11.96  )
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

On 9/18/2025 1:53 AM, Alexander Wilhelm wrote:
> Due to internal endianness handling within the QMI subsystem, all QMI
> requests and responses must now be provided in CPU byte order. Replace all
> QMI-related data types with CPU-endian types and add the necessary
> conversions to ensure correct interpretation across architectures.

I think you can break this out into a separate patch, but reword in a manner
that doesn't indicate any dependency upon your series (it can be a predecessor)

You can do that by noting:
1) currently (before your series) the QMI interface only works on LE systems
because of how it encodes and decodes the data
2) however almost all QMI data structures did NOT use endianess-specific types
for the data structures
3) the ath12k structs being modified are exceptions
4) the QMI interfaces are being modified to support BE, and that modification
requires the QMI data structures to actually be in CPU order
5) So change the two ath12k QMI struct which currently use endianess-specific
types
6) This change will work correctly with existing kernels (which only support
LE) and will also work on future kernels where BE support is added.

Then I can take this patch separately from the QMI changes.

/jeff


