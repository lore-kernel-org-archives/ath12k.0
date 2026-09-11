Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED3C88E53
	for <ath12k@archiver.kernel.org>; Fri, 11 Sep 2026 19:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=LxWKcapJWtu6Wy0IBrQcvApK4m
	NDNd55zTub39UGJJRjjjWidOwI9QghB8g0NM36M4QehHYEHCqBlf8ap5GS+M9KhuIuhxugNYRcC3M
	V/TMdijkriZbSXTFMypaBSo1fGu3eH9mV1YNfs8jVFLgwSrMcDsKYcbEeuxX2tKmbh0v+OSPwIdFN
	9KEYFjKCcE/MzRc4jyDcAxb0mop87c7qSLXF40Niu/Q8F7KgOILZl3ETiFsybA78A5710gsG3IJlx
	GsTgeiFFI7Wi//jeNGT5nILx1Co0kP6pCLPBUzYw/wfQ+BbY3EQVZorlO82HcWQDxjADPIMxZOXY3
	j+jv1d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56mW-0000000HWa7-2YUe;
	Fri, 11 Sep 2026 19:19:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x56mU-0000000HWZd-2h07
	for ath12k@lists.infradead.org;
	Fri, 11 Sep 2026 19:19:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWnpu1462181
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 19:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=; b=Gux0B5UbIvbrfSbG
	WCX/heFkRvUZQPCsQkJxJs6z9uWTzM8Aej7j1ybGt7NmcHA2OguMmVbD0NgqwuBq
	0N3u0x8yfaqAjas7TWFuxjrA1X0LLYDmzok3TSORTsxkp/dEdOxYWm+9UWyqn13O
	9dZsqi+l6sGyMIZSxbDYUzEOfvi+PyIVR3kpCKDPYBgzaX590uIFSb/7lIqMZDFv
	Uj+/Zx4UcuVYyMESulXadJsHbEq+rIdZN2gdrE/E05MooV35KpIssBgB1vQ5bU7Y
	Hw+iRLcSLrKuLoX+WtvwyZ3rgTu1ukdX2NeAjdLexrMz5/QLQZEsa8i4zur36xHf
	r0sshA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmp0dgdyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 19:19:25 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so2293682a91.0
        for <ath12k@lists.infradead.org>; Fri, 11 Sep 2026 12:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789154365; x=1789759165; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=X8+qfLvpYiV+CCrCYib6A4HGihZ4aHvIKP+l3VDvuBsSEEGNSDEVmr1GwZgfYCFFtf
         9PxXcjHDXycZ/13DjRza571I2sW5bAm5g/dDW6mAEZW6V9v0pgze7yBX9kUbQkz9ct4n
         kYQe018EiFAZvxHaqXdD/0ogMjo1uV+bV0L/I8vV7PH2eiga7BAtULeZMGcSysJlDD55
         9iXfxpttY54AG9v/bsyQGVtMDsrfKsHfHYnst3eKSesgqkZ2aGEHgnGeSYfbUaRQvru1
         K3Py2mw4LmqlQ/PzDe8RQV/aa0L8LnmQDAsSn7Z1y5opYLEwUoJ7GB07LXb4czuMhjhq
         MsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154365; x=1789759165;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+DpU9d9yKH3MESahifjxuxIqp5MAA0YI6mbsse4jUfs=;
        b=fiKWwLuwZyzNnM22jWe3oAVA6YJ1JFM2c43wi+0v6f4srxMI34pCNbLj7nuqbQydTR
         K52iAp4jMVELj/yJjG5zfsbIcIII5z01Izm3NbFMpI4xr1LhVL8nN78ojdxvAlWAOeo9
         3H6bNHIaheDYmxiODMShX2Qs00ToOdP/fVPlmHsDFRzRROO5fkeu/nfY5z6wwMGhnNAa
         wk76zPxy+czHB5h7cRlmZ4lOKSzbnQ1fSd8RRIgUUjOP1th3RkBNufrLpKb9EcMD2Eoa
         QzZqB/+UgyHQx8JhaOr0RPNAF0nwoe9u9Ih6JtN0OwEb7mcS8tYX/H8qHQhQLr+/Zxo/
         nbaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfWq3q/8calGgLjEgcJbhLl6STtMRaDJdpbkryTsMMK7kEbpSvOcfRqXVMBKmK65hyD2jz4Iw=@lists.infradead.org
X-Gm-Message-State: AFuF++kuNXrh0LUAt4f6/NOCqsBjqd8vW5fFuSp8ML39KcD6cZ6p6s3Z
	shBn+jaYDAOGwS2w0bEqYs5BB+ULl7NVnhALGXhHRmPm8P+DUbEMmLDRaTIQOL+7Mzoi5oSHY/f
	O+6uQhW3VHMQkHvc5KTU7GX3wdBEyxceidw/dzFOPb9MWGIGg7HBuAMSZQqS52H/f
X-Gm-Gg: AYBFou34xGuYJuA/FvQRiVuuhk3dbXQKyJmheEtJ3/74NOh0tYopepIGD6aMYBh23Ca
	zS1/Un2H9kIptLPC93bqAhJ6p7An0ck6nECL1MOJe359sJ6DPgJlxADr8udTfD/EfZ2y1Xky7nl
	MxcgIZeyZ3soyZ3fa2F45bwX6gJBLKFijKNXECplnuZVTAsrUlZxNOg5ke48yeQ0/apn4GkKUCr
	BMhTISlOlkOEzlTZ7DGev3Tg3J5wVBwg5yUB345NwDXLdoYUoYmCOMVoIoowF1hVt+aGfmk8JJL
	Wf4VQ5oNjgzomsWlUJOgrOqpNh7jxBftpfrtawaeDVRQWXIPlvVUeDU1iwqU/PzYYz7DqAzT4Li
	GUPil2c40j8YBgw+TqgXwyu6Khds3a21Jryz5gjptF1eOu9Xx+poyt9EkUCiu
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183559a91.13.1789154364737;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
X-Received: by 2002:a17:90a:d64e:b0:395:4de4:92be with SMTP id 98e67ed59e1d1-39d9c1db130mr11183505a91.13.1789154364261;
        Fri, 11 Sep 2026 12:19:24 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365a59b18sm8253073c88.2.2026.09.11.12.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 12:19:23 -0700 (PDT)
Message-ID: <ee32feeb-e626-43ba-926d-5786aaf1d960@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:19:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] ath1{1,2}k: support multiple PCI devices in one
 system
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Mihai Moldovan <ionic@ionic.de>, linux-wireless@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260908093145.2492666-1-juha-matti.tilli@iki.fi>
 <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <2cf63e00-95aa-41ba-ae8e-8abbfbc486e7@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U7EHnuru c=1 sm=1 tr=0 ts=6aa4543d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=b6wZdvJBkCi_B7orZsMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: X-Lfz-_B8zAc_9VMpRzR8FPt2t2vBjCs
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfX22rmv5neddxA
 q9n18gpGmdDp4h2XKix92Qu7hVoQjPISrhSt97TlVGGgXr+j8HxaGzoa31kwbiFM1Pu/dTRjABG
 Z2kjj3SbOZ8CemnesjdLR6ht5gvUeUA=
X-Proofpoint-GUID: X-Lfz-_B8zAc_9VMpRzR8FPt2t2vBjCs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDI3MSBTYWx0ZWRfX7JiDesO690y9
 INMD7BEwbWvJ4VVfp5JwPdjFF8NwoBA36M2bjuUN611fyIcTPGIEWvjCjN/ynXaOSRzkUHj6fIt
 cu1VsZXfHEYt8wWPKaK7yzfuCvbxWboytGy4z2LiXNzpVsv81pAHkEx/rQVcVP/0MB0tC3yisDL
 ZmZOLQ3yO+x6VV46YxtuYN36vGfdDz+Okp1JDuPRClFry+ldtMUvfxeSwzgfBDx2N19LsGFdPj4
 Pq5wQ7IVkm1VH/j14LD3reCRWQhXmYGfm82YI4IlnkSp0qHOxJ2LmnJKTj96MThZKc6OSibM5G3
 ty1ab42SeOCyxfzbV1nipn0iP9OYZtUS2cbCE9EgDj90Imi+jkPwpMTDAtLp11+UcBUZscEkhAr
 z/2oeup1Ouarg4aC+Ll/SdcWA7cvGKyJuivwlEj6O8jgeHzCcIsplo39o/6izhLYe0YvtTbu/rB
 JY+jjgLtJ8Npay4hI+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110271
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_121926_681899_24E0968A 
X-CRM114-Status: GOOD (  14.93  )
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

On 9/8/2026 2:44 AM, Juha-Matti Tilli wrote:
> On Tue, Sep 8, 2026, at 12:31, Juha-Matti Tilli wrote:
>> As you may well know, multiple identical ath11k and ath12k devices are
>> not supported in a single Linux host because they use conflicting QRTR
>> node IDs. Fortunately, Denis Kenzior created a patchset to support
>> multiple QRTR endpoints with identical node IDs, and Mihai Moldovan
>> refined it, after which I took over the patchset and refined it more.
> 
> Hello,
> 
> I am incredibly sorry by messing up the threading. git-send-email said:
> 
> 4.7.1 Error: too many recipients from 83.150.90.33
> 
> ...and failed at the patch id 8/12.
> 
> So I thought retrying from where it failed would be safe. But that
> broke the threading.
> 
> The next time, I'll increase the waiting time between subsequent mails.
> 
> Links to mails missed from the thread:
> 
> https://lore.kernel.org/all/20260908093437.2493698-1-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-2-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-3-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-4-juha-matti.tilli@iki.fi/
> https://lore.kernel.org/all/20260908093437.2493698-5-juha-matti.tilli@iki.fi/
> 
> BR, Juha-Matti

Unfortunately this prevents many automations from processing your series,
including mine which utilizes 'b4'

* b4 am -3 -S 20260908093145.2492666-1-juha-matti.tilli@iki.fi
Grabbing thread from
lore.kernel.org/all/20260908093145.2492666-1-juha-matti.tilli@iki.fi/t.mbox.gz
Analyzing 10 messages in the thread
Looking for additional code-review trailers on lore.kernel.org
Analyzing 44 code-review messages
Checking attestation on all messages, may take a moment...
---
  ✓ [PATCH v3 1/12] net: qrtr: support getting new endpoint ids externally
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 2/12] bus: mhi: allow mhi to know about its qrtr endpoint id and
free it
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 3/12] net: qrtr: mhi: register new qrtr endpoint id for mhi
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 4/12] soc: qcom: qmi_helpers: add QRTR endpoint ID to qmi_handle
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 5/12] soc: qcom: qmi_helpers: optionally bind to QRTR endpoint
ID in qmi_sock_create
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 6/12] wifi: ath11k: add QRTR endpoint ID hif feature
    ✓ Signed: DKIM/iki.fi
  ✓ [PATCH v3 7/12] wifi: ath11k: stub QRTR endpoint ID fetching
    ✓ Signed: DKIM/iki.fi
  ERROR: missing [8/12]!
  ERROR: missing [9/12]!
  ERROR: missing [10/12]!
  ERROR: missing [11/12]!
  ERROR: missing [12/12]!
---
Total patches: 7
WARNING: cannot prepare 3-way (series incomplete)
---
WARNING: Thread incomplete!

So I cannot evaluate your series.

/jeff


