Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D18CE77188
	for <ath12k@archiver.kernel.org>; Fri, 20 Dec 2024 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjz4Sq36hjRrUju32Ul73yf+4eJ4TQw8j+POxAHkw6U=; b=1kiI4ypb8M+xxW8CTH8iUkrcPs
	XaG3V1waVfK8j0KEkZvTj2eYpYWFEu9mFM4l6Sisf4zzBKwO2KpJonceeyFS2qHe7s3sX/qwtG/Xz
	k/we/YdcV0m3Lyc+LILixZKc/ivZEW8Fly5kNz/2cPKF6AgkMRka55G//lHQK0eQ2vga45jbrc4jj
	SsAPlnfBuvHr0hLKZ7MO/odqILTJRT8b1DnNm36J7t4VkfBRiEVDzA7bPvRI/CezctzYrpDg8fPaT
	bj2LNRW9ko9anCtR1AHhRLLhS9ygLrhWHYKPXUgA7Z+mzJHZy1bIkrtIodRu6SNQoByS3VP06Fxh8
	O4JMNMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjDe-0000000606D-3FMb
	for ath12k@archiver.kernel.org;
	Fri, 20 Dec 2024 20:03:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOjDc-0000000605k-2ck1
	for ath12k@lists.infradead.org;
	Fri, 20 Dec 2024 20:03:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKBcBkE024185
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 20:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjz4Sq36hjRrUju32Ul73yf+4eJ4TQw8j+POxAHkw6U=; b=oGWLRAl5+IHXStqi
	BuIYkO6QcmyJtbmJirgCxxb4AGmWJTSYFDq4KQx/ItAD00CgQbz0qv5OQbBdbwJ/
	YACVnW+5UhSxvf11eDzIq8Mo5sa0hvThJ1LQ5ZfenD8ynbmMSUWcUgM/kE7247nj
	/fn/em1aSY4IQTVzFxpNUraO/a21l10ZW9VVEz9vuupoKaszp43miFHvUtrDLA2c
	zYC6YIXLanddOZZ15+VzhAKwEJzUAMcG0JW7iSExoK/MEFb4e3djHpK4/ul7PZvZ
	je+OMzU3WdU4r6sIOVELA9HKSZ4r19PE+46qWH9Zi997E4mqH4IYWf6TKSRRBKG6
	cRa1og==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n7vg1aaf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 20:03:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4679fb949e8so5447371cf.1
        for <ath12k@lists.infradead.org>; Fri, 20 Dec 2024 12:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734725005; x=1735329805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjz4Sq36hjRrUju32Ul73yf+4eJ4TQw8j+POxAHkw6U=;
        b=mUeifZ9Z1kFm0a2D5Y5ess7ZJ/mBbSxEfB8oE7efTCkSVbR2CUW03ThdHKhoQuhTzn
         C4oYnYxa4V1pHqMdknrwD+IGZifKR6bCux9APrFjUhHTWoMZDEv6BffC/Zds3QhmPIff
         lwHp098mChYBMURdMic3nYtFKVLBWzAgvzHuw2JAtOtjjJpijReE8JGC3BVQzNDlGQ6N
         Edxda4/EIyYdj8RZQ0lUy+LwPjhNkw6MrjJCV6qQTY0nLUqPESS252e65FyTABUVc9Jm
         jcafCZNcfY6HINR4Nv8UDy3leN/Az/3ObboAfse+Otl7VZQlpo0DxZnk5UBb2qQLIhR1
         5++g==
X-Forwarded-Encrypted: i=1; AJvYcCVAVkKHkDhL2CqqOD+VJLjP/FDzHYTeOGDkDSuSUcu4mwcV7L53rlxMOWs5FcIk99NKJrJ03CM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj4hvDLMQxIFfRyQqFuqDXOc4CpXc7+EQl0fql88rU/mLm47Dn
	DlTQzLeoDRppS++2P8fyCkpjLgCEj4aQG4apASPX13BqRbpE2XV2IjJip6NHSq1EkOz45/i063S
	fqHvZ59qnvM7QgMkLdqTrCwvSEr+Bu33g4cT//Y/KbTz5Sh8XjABVozj7GrEw
X-Gm-Gg: ASbGnctdBKohymuhKL+4a10Kez1HJ5OvE/9KutbAlxlhoBEn9ilXcAHsv4LPLh8sMFo
	rPsXeGP4CC7/xdEKIfd6Aa9D+3DesvrBekU9jD5fobT6OVaSyDwU6hLhoCBB1LmNg+7ZV9NkR2o
	cghzagIlLBfkwCHZN3jdXvys9h/qqYaxXiWH4UUCFkgPRldOooJzA1xWpqLs+jAJ9iwK+t9nzg4
	QbnGcBl/CJ6N3Zrx0LZ6rlBwgdmw4a1ECH7Ee7NnA/D+zLYj+9y1BPVBi8WR9utCL9BqnBeNRXz
	ipogZ8/TrLqi0pyFUifjM08inKXaZYxk3n4=
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr237022585a.7.1734725005381;
        Fri, 20 Dec 2024 12:03:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGOU1M+QO2EF012zHKw00KoR9fn6Wc1NfhNg0vW4QRfK/giOH6H62ekNUf3K/h976xQT1AJw==
X-Received: by 2002:a05:620a:2496:b0:7b6:e61b:3e60 with SMTP id af79cd13be357-7b9ba742c0cmr237019085a.7.1734725004858;
        Fri, 20 Dec 2024 12:03:24 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e830b2dsm206705966b.8.2024.12.20.12.03.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 12:03:24 -0800 (PST)
Message-ID: <9cbdca90-e76c-4ebb-a236-a0edbd94a629@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 21:03:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 1/5] dt-bindings: net: wireless: Describe ath12k
 PCI module with WSI
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20241105180444.770951-1-quic_rajkbhag@quicinc.com>
 <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241105180444.770951-2-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KPneJ_rd4APqgKu50p5OFXAMO1SaeGBe
X-Proofpoint-ORIG-GUID: KPneJ_rd4APqgKu50p5OFXAMO1SaeGBe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_120328_791349_C444ADA8 
X-CRM114-Status: GOOD (  13.43  )
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

On 5.11.2024 7:04 PM, Raj Kumar Bhagat wrote:
> The QCN9274 WiFi device supports WSI (WLAN Serial Interface). WSI is used
> to exchange specific control information across radios using a doorbell
> mechanism. This WSI connection is essential for exchanging control
> information among these devices. The WSI interface in the QCN9274 includes
> TX and RX ports, which are used to connect multiple WSI-supported devices
> together, forming a WSI group.
> 
> Describe QCN9274 PCI wifi device with WSI interface.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

I think this description is missing the key points:

* what is that control information (power, data, radio stuff?)
* what happens when the OS is unaware of all of this (i.e. what happens when
  we don't send any configuration)
* is this configurable, or does this describe a physical wiring topology
  (what/who decides which of the group configurations detailed below take
   effect)

And the ultimate question:
* can the devices not just talk among themselves and negotiate that?

Though AFAICU PCIe P2P communication is a shaky topic, so perhaps the answer
to the last question is 'no'

Konrad

