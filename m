Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D304C7EE2A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 19:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=; b=wDTfogZuWPuof9tkokktXReA3C
	ttbZHIDsxO3+eBJtLzJULnoSpTAER7JA726LPazDnquF3ljMAY2VoiFJLihRi3sPy81HXmZtXV+SD
	p6VnrEDBBokn9dVx6MXCFW8x/guk0Fi+5u+72agPk7fHXvBlAIHyCTDAFswQ8V0gjGt5YcLfQOFNc
	8uSRd4wsuTStnVKOCMNM/Ag0diHQSU+EUA3DofRZmXbDZTVqBJYFTulRL/yEo57PO3WnOtGA3ePF7
	dlOE8mRDIskROhzJSqMnS7Q2yDjk9cFNJjec6hA4EUEv3vUD7vnGkW2gLDTIfbKbWbyi5fX0jtQH8
	GQTt55fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVENt-0000000FZZ6-2iyv;
	Fri, 27 Jun 2025 19:05:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVDPR-0000000FTIQ-2q2H
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 18:02:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RCM6i7012525
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 18:02:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=; b=g3NEW2b0bFIfBcyC
	mGcLZ0xUBLf4+Da1X7MTnb1+BsglquiOBXcG48LA4YA6Ba24qIhbGyencYdunnOi
	K7U5QQgmxAdoHBIiUgLulYL9llvhfB+bvh3OMSBcbCwIKFKXaZ32FU6TUGk1YBKk
	3+PH0VpOlw+gnBDBI3GhFnHZ5yOmkwY+3CXgcrrXoFUu1eimTaw2yorYCU3XJIqb
	mfDax1Giklbr/xjd2VWGYp5M0S/RExWybMKoAJPfYCVmVb4nmx2j7fksY5NU7JRg
	d/DT4r28f4D7wXCVcVgTbffWMuy9pKpJWUWD+S5Qb0DcK504eOoUmqqKBceONBKT
	tP+isA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b47jyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 18:02:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b321087b1cdso230872a12.2
        for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 11:02:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751047364; x=1751652164;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7K3dz0RHRwog01/5OhJi5jfcUQuZLwHGDzYJ92Dzlow=;
        b=GcSwiS2uPmpEuK2JrB3V+K84yXjezX3X0IM0sdU3YOLy54DuFNpn9OSOSbY+olJy/o
         mR32318kgfi/ZQa72kPc7tmSlxUNrvA30dF4aqdvp0hM2Q45SFaGhKCAlZcQb9kxW/f8
         9iC12/hyQwWlGi74nzd6vZA3uOzZAbodOmPlzob4+7bwj9Xuat5o0gORRcs79PBj62s7
         F0ZyfEedDLrpBMfMrTez0KejXSFOYAaY5CUYaaitq81k5z8qO5qfdWh+KaZQN6YIpU8n
         11N2tYRPDVtTXXZNNbqu/lb6EXR9kN0wUoCk9/osx57XE4AJMyLPSHGzD4eBku6dK1SM
         0bwg==
X-Forwarded-Encrypted: i=1; AJvYcCXe2/iIGc1dT94HJi74UBKyuJgoIOTLSiJwetblzyuzrkzeoaBc6LW/HO6mNBp2sPI+53zS4zg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxa0m/i9GbhwPR84L/3NLcIkLlQE1IFaQJEXWF0rh6oIQE7QM20
	7P4hYagPQbHpkNc8amBq/U0hcp0kkf7qFSM/3nVBH62vc6gyoBSrGYzdPZNhV3m0gGlUlu8XbNs
	QZFfdT2JKd7cXiN5j8fHMYB8tGimaRgqAXxEKgdVT4HNL+euuFJV8BbaxmxPO+Ux5
X-Gm-Gg: ASbGncsma7VlMWLNbTIyNglgQ4+9GGqgdV24e3wpQEaNVdpyudvHTAdgolCtEjravUe
	HcMBJ6frTRSjUlKKs4yEFWOYHqWNKai7X0Av9x7KoB6xbfLekt6SgDvhTMDuCBpwUXJ6pfgwXAn
	gW8Hu/UsT+U9iyeHm+mamlVlSFQI/UijBBpGgIoVmC/2hChS4LufXSwF8f7E84Gd3Mwhv422TvE
	IKaAgUWdshw2DxAlxsF1tk5eQpBBXjYrSS8+OSTEmTNqe58Gt6SqEQ5pBch/DnyfFh6UrA0rBan
	ucKNgfkfVmkwxdVs8tYZLUEdJHwjXT5icDTcPYerL3KzZOy1SfdG5f+Y8Sr9XEKwYsCAbm5STaU
	es/ojm2n5e+QQuLo=
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr6489714a91.2.1751047361907;
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4o+Zl6QsXsdfBN7hrGiRGlLA6WRZLfmh7CC7eb/MtvMgcOsqRL+ouKIiVZVN9U4e8XHCtuQ==
X-Received: by 2002:a17:90b:3d87:b0:311:9e59:7aba with SMTP id 98e67ed59e1d1-318c8ecd027mr6489669a91.2.1751047361456;
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f5427099sm7491870a91.29.2025.06.27.11.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 11:02:41 -0700 (PDT)
Message-ID: <9c4be921-930d-4be3-b231-f7a45908b774@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 11:02:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix timeout while waiting for
 regulatory update during interface creation
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Kang Yang <kang.yang@oss.qualcomm.com>
References: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250626-fix_timeout_during_interface_creation-v1-1-90a7fdc222d4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE0NSBTYWx0ZWRfX2SGSm6/ZdFo8
 CX/4v1AS+B/7sOGaBS6eyH3ugKl0xCf+vdT/ExJo6rSIaGinApPGd8jZ+c2stJYSUMbNpQd1y0Q
 MXLiVUrQvuS90u2z6JIFgwy/ifAkybhIoNxqAN/CnVufHk0K3qs5tW7jf14UoDCISZZwIhe9WYD
 5pSEm8R32s0TnXzdYule47nFwKsDgffhBuQYcZzwdCLP/nDhEfEcxa3n2K2fRWKCcFSWQcT46xn
 8IFcvOkTmJt7mv6G9GOtPC2iZuxNgeD/8riZKX+ntZtqfOoq0rM1LazGHJyOHiRxJz1FSFxcJ/3
 doypRS1trVV9S/2vFIXS9OvNA4AxoN+atxIygIjlfQDkeFyFmYefkrapO7Raam7SoSmXIeTUoxK
 69n2+fN5NI/JrjHIw6wDRsbkpLhAVtnqBmZV1Wq5FVNUSeNIfixmfbMQkUCKoAJ9+o2LIjKa
X-Proofpoint-ORIG-GUID: l6xzt3qYwptm44UcCtyMmTBwfF89ICiF
X-Proofpoint-GUID: l6xzt3qYwptm44UcCtyMmTBwfF89ICiF
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685edcc5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Cu1Hzb5Yk4M5GyBUqqUA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=755 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_110245_724175_776042CC 
X-CRM114-Status: UNSURE (   7.73  )
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

FYI this should have been tagged for -next instead of -current since the patch
being fixed is only in -next

I'm in the process of picking this up now

/jeff

