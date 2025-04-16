Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6212EC369C7
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 20:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XU+cG4Rl/BauvGaZuqJSxBXPHrt+N5HECp9+iIJrFUI=; b=Q8WL2dj3WxJ5GMe5PYsc6v+GDI
	MWu94K4cnAI+XI529DBXSndW0TbyYM2SojD6eqTXRrWI5gylRFxkiortLirF3iNOIY5JOBEyZ5yPs
	tutuklMO/Vydj0N2+s5gxah7HuEJV6EBp/S4fl89kbaq/m4aevwxB792bbqTFuMyfgAPA/kfxtNfC
	BQN55LKDY3inFkS1HdlTrhug/seLxCHWwAT59fWYfrFSMN+/mpH0Ah+mV3Ys0BgUUDln81+Tzoy3V
	2SRAufcx/FotqnvwmAAQC6ghCoDQP/ohsdn8ttt5TT7A/SkXLZHCAB19VuLFCHtI9jpDM2SB9KuH5
	dj2DX9ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Lh-0000000Aoja-0L6J;
	Wed, 16 Apr 2025 20:27:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Le-0000000AoiI-3BbM
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 20:27:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mGcH020661
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 20:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XU+cG4Rl/BauvGaZuqJSxBXPHrt+N5HECp9+iIJrFUI=; b=bdAnfQLxqVZGCsnY
	RH22UHKRIGaAfAKrhh+oUpqe6goVwFcCvkLr56UaT5Nat/Xqg5d3IpfnMJSPH68k
	AteP+6jdMdG/PtfMAWomBLP4sH7WLmT1ESR3VszOLhW96Dhkt91iNhc9V8O+Wk6Y
	bFpB9+Wvj9UvCO2b0NnqvWUQavDUO2PUoNEz4kSvAsq0zbs6swouXOPaQwfCkP6u
	mDwpCSuqv1OKfjmpFWzkmeCAl4VREJ8+tNIB/h2ZION03Ay0JzWrGOnGoggUd+00
	maYsIq6LI4PEx/fEbt/EleaMTCvYq8cVduS3wPhlFIo+qYJePGC7y4IcLbTJGFy8
	HLklCg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpvjmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 20:27:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff6aaa18e8so10433a91.1
        for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 13:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744835224; x=1745440024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XU+cG4Rl/BauvGaZuqJSxBXPHrt+N5HECp9+iIJrFUI=;
        b=g3iG5fhVj70mMv10aYBeyQw2v+2XTC5dRLQLHXEMpJrVA2dG2yvT7/7WYhpUGsuhh2
         /76LdbzQUEhViEJiR7vhaQgE4ktV7KyP7c1PLPb8ZdmQ+MuWKVNSgfSncWYep94BwaT+
         6kpAxyVQ9VkzQchfGORE6euqpyYvNXEp7WHnsK1fxVbg4AQ2l4y6uhS9iQRaKKg0FAPv
         YDUFY0+RMpV4uAmyA/cGaYjzaQRTo22W2UcMovySgyxUseCAcnjbZr7lwrFyJQ7Z8gFU
         I9h4qT772N9Qvod4TF4gWlgJevOFswNU8yCMZ+/oRgmW17jII9vU1WSfVGheptnHXjKi
         l/iA==
X-Forwarded-Encrypted: i=1; AJvYcCWoO2cTp74ey8jFUEc1DESp0+iRFdXL/5w0iiw5+xlKSte0blVIsRd6vyYOhEhmFUE6LIx+x40=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVMYBUKWWgNOZm8pisYfTwiOWWWyArzlSMUSJazcS8KjTBPY2m
	zSbxZtOF67wF92Zf82tnGDJgezhTmVSy+WK68vd7Fm0qnXikRLm+jzg0ZBnx2F6tNa+650+B9lu
	KKU6a/smGzZ+xlG9aNEBw8T4gN+CM7wgBuOIjry/hSafoz37KbkCziohoqpyM
X-Gm-Gg: ASbGncuH5ifAgWYQ2XYvXuURWD95irT5ddmolifoKvplKmu01HO8xIXHeFx03OltTZ3
	+AlsEHLUq7ATEF8ogsKqedBwpewZt+HG8zjnu90liM0Ji3l2tGZ34ES4BvpFIcs4uB6pRVdqU6h
	Dyg8JSZ2b02iHAw4y8hPCc91NNNKjjcFIPfM1Ss0xEj7+pDZpaenHrZnHU5SMIzAnDD/8opZcCg
	CruKC9VMi/T8O9YhdgKHQzWQLdQMsidkmk0G+3NMEHc472s0XYNkD21rhFtDaT46GJMowd/js/B
	YJwHo/bT+QA5uOUP+87aUqfgiWDXbsV2qUf0sqEGVDwY1RpoDS9i7zItpZBVqAQafR18ArbX4Da
	7NrCs
X-Received: by 2002:a17:90b:5188:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-30863d1dd4bmr4826688a91.7.1744835223885;
        Wed, 16 Apr 2025 13:27:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuo7zvWoyCf/GU7A2RTisM4TY7siZHVq4sAVZKlpNh7JppDbecdnn/W7Fuo/7ITI3MuDLLrg==
X-Received: by 2002:a17:90b:5188:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-30863d1dd4bmr4826663a91.7.1744835223529;
        Wed, 16 Apr 2025 13:27:03 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308611f00f1sm2092884a91.13.2025.04.16.13.27.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 13:27:03 -0700 (PDT)
Message-ID: <3bacca4a-94c8-435c-a480-1c18c0f9f5f2@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:27:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Add MSDU length validation for
 tkip mic error error
To: Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <quic_ppranees@quicinc.com>
References: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250416021903.3178962-1-nithyanantham.paramasivam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: OqWni51eW8QImkJHhuNCj4BuxZNptpX9
X-Proofpoint-GUID: OqWni51eW8QImkJHhuNCj4BuxZNptpX9
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=68001298 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=pYjfoAi3eAWinmu-FJwA:9 a=QEXdDO2ut3YA:10 a=AurkjTAPaLoA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_08,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=535 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_132706_804313_62E220E2 
X-CRM114-Status: UNSURE (   6.94  )
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

On 4/15/2025 7:19 PM, Nithyanantham Paramasivam wrote:
> From: P Praneesh <quic_ppranees@quicinc.com>

In the subject: s/tkip mic error error/TKIP MIC error/

no need to repost just for this; i can make that cleanup in 'pending'


