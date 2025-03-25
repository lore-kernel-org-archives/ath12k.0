Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC1C35FFC
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 14:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sccn61YffIOVf72k4v7cFNWsntpRWvOgplQHMkBT7eM=; b=kve1LC3O6e5aw6W8hByE1CCF13
	rL4V6YwhqOt30w90Tpx+0GTjW3mp8UNgIz42U7kU7nfzaVQogF7EkYnZjG+CPqi9vN1KpE0ww7ytd
	uy35ZYABufJKBAb9zZbi8gRfGQpB2d5rYy57HCrkYHomj0LRFaFF969eqvZ1E2vadz8KAHCe4J+Gj
	UQ4wkpy28tV1XnPbuLeynssuBmyPeP21tHYY4FfdSBdt4AtmjZYkI/yGt0jCojJTZfDA5dCFzewk7
	I1zyr5Xpx/x+15t7Xds9x9e2MosBvv467zO73GC6caypwkq7x4Lcw5yG9/4amOLG/wYFrikw2Aw4X
	DQhK0GdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5id-00000006GDd-0vSv
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 14:57:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5ib-00000006GCc-1Nr9
	for ath12k@bombadil.infradead.org;
	Tue, 25 Mar 2025 14:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=sccn61YffIOVf72k4v7cFNWsntpRWvOgplQHMkBT7eM=; b=Mod4lzIwYCMbS98sE5ExvCjko5
	417I1vBV7RWVXrpMU2XRNaKj4D6ZAcBcZZ7C4hynIM38LUAAtee4p8Yk+5aB3UBNUYR62Z5iKVbz5
	vClxHmS/w39kSX6ErMcYL8b2RKZZ1QM3AtTmVa5xAvP+qoRLt358zNJaohV8YXSTbKhx/rTDWGNlR
	H5IomoI3dZDRTFFtgvi9+ypFd/Pqd7Nqy4L/LqbkVycBCKVDe9XFjpigXVNmat5b0hwqT3VWM4YPg
	gMTX35R1ghVW6ahUQ8Qo+VOAFipuPqnEXQSKE4mK9BlRr/u82GsxNAkDKa72yiydgmy3LBAacnaTg
	BNo7fyKA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx5iO-00000005WwO-0TYP
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 14:57:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PCuEi9017070
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 14:57:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sccn61YffIOVf72k4v7cFNWsntpRWvOgplQHMkBT7eM=; b=ReNQKVduuIUpZqLx
	tIM1mdfFCPIkc+uPYpJylxYNUpfvedxkEyeVXODjtpRqqYT9DpIoQmg6zUgfIvDq
	2YJvsoqhnFwtwh8q20wbWKvzdRx02VxSgWBI7z3NPzlXQKwQdXUGkmfAzxz0VdmB
	T/GhVNmu/jeecuDNgskQk3AV4dhdxaH5+zAF6D+h3D/G3NStdljouh+7H4zUEwVr
	5wGOB31/m068MseWzpv8qP/FSEgVHsiTBuzSdClfscomGv6d/l/bR7rncTWIZ8n5
	185LmyxTH8q2bpU2YkxF6cpCr/9fL3R3S3YyyEy7KnJrZ92fJvnHivKLr8Zf3o69
	h+uyWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmcy9yna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 14:57:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff52e1c56fso15180738a91.2
        for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 07:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914623; x=1743519423;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sccn61YffIOVf72k4v7cFNWsntpRWvOgplQHMkBT7eM=;
        b=lbA+ndrrKzf1ZvnxHBCs3FCz2+MWAes5UX/sZlgCpk48jGKj4FD9ejiZbwb7p2PybP
         uBpNSd6oRTemde0eqdHt9dnA0Atq2GW20dRiDu2NvgqDf2BntAUNdjwv/UT571yY4ibI
         u5TN2eUF19OPBILbz93ZoKTQVhmQdc8E/opyw6kVpNLIzccsgKyWg4SmHlkCLNgrKf/Y
         Wp+6LE1eEz0qeUjcg20HNYfvTM9bZfwTfjRHKL/Q0lhUAST4r92qwfdpI+guPn6Xc9qa
         cEYJ9lZgmS1HFI3uNIn6vy+rGzjaz7a+kRZa6q+tu05Odd0LmRSzVAp++/psBdbygJhm
         Xqfg==
X-Forwarded-Encrypted: i=1; AJvYcCWyIH2lqO0GD/it4mtjspnzESehY5WifPgIppH+MQ61F8FK6UiNJ+BARJDQ32PeMM4e0S8wSio=@lists.infradead.org
X-Gm-Message-State: AOJu0YzFZOjStohhNo+hUdH2FxYerGCWfwPHW4CUoUI9HW21iOhJEdnb
	6vKFzH0oAbvwdT5cGTPu/LgLx2Keb6T9tubH6dLcuqzg+ooTtDa46bZ+6df6qL7X45LSOAqNalE
	uJ0Q7QpZ2Hoi5NyhNDV3L4Y8vasFtOA5WXmPFozGKwZNfg6QlF5JX4rC8uNvV
X-Gm-Gg: ASbGncvSy1el0D4xf7WxLtQMjvaU8JU0zGte49ZntCWmWWFRF1y5gap1XNJe+2did41
	4OavUv6hytDa0hHm/4ytyg0/tazPU6oLFJ4WAmpfVq15JrYWLHeSlyu7atgW8WpQ7MzeloEe+Lg
	DehYJyxxLAFHzDSUjujMMTN3cVpOj5hXoRdtBkZj0SPAN4myXJSHma1c6ukOFbiKWn2LjARHUjc
	BH4x9GsNoGvgKeh16KxPUyk0HRzRigL1Myx2et33DLTV3KtKyjzFU2eWoaGfrAYW/fl/zFulYwQ
	WwSd+7pwAUVILBRN9+9D8fSFh0NzgMyF/8JoZ/1aslpjsDdUkva1
X-Received: by 2002:a17:90b:4f8b:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-30310021a17mr25929456a91.31.1742914623293;
        Tue, 25 Mar 2025 07:57:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuMFcW5Mc6PLB2e9P1WD+ArFqapEY7WYWu/v0VV2vjM3az7z7rxhMWP+snHjYJQ+Oca0tXQA==
X-Received: by 2002:a17:90b:4f8b:b0:2fe:b8b9:5aa6 with SMTP id 98e67ed59e1d1-30310021a17mr25929413a91.31.1742914622771;
        Tue, 25 Mar 2025 07:57:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61a73fsm14496467a91.36.2025.03.25.07.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:57:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <20250321-ath12k-ahb-v12-0-bb389ed76ae5@quicinc.com>
References: <20250321-ath12k-ahb-v12-0-bb389ed76ae5@quicinc.com>
Subject: Re: [PATCH ath-next v12 00/13] wifi: ath12k: add Ath12k AHB driver
 support for IPQ5332
Message-Id: <174291462168.1228728.13742084811292852249.b4-ty@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 07:57:01 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=EZ3IQOmC c=1 sm=1 tr=0 ts=67e2c440 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=3RKYKuViV1jtgHVlbD4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 8t02LZXI0FvtSvr1SZGuIgLR6IHoywwG
X-Proofpoint-GUID: 8t02LZXI0FvtSvr1SZGuIgLR6IHoywwG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=961
 spamscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_145722_650530_CDA4241C 
X-CRM114-Status: GOOD (  13.03  )
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


On Fri, 21 Mar 2025 16:22:37 +0530, Raj Kumar Bhagat wrote:
> Currently, Ath12k driver only supports WiFi devices that are based on
> PCI bus. New Ath12k device IPQ5332 is based on AHB bus. Hence, add
> Ath12k AHB support for IPQ5332.
> 
> IPQ5332 is IEEE802.11be 2 GHz 2x2 Wifi device. To bring-up IPQ5332
> device:
> - Add hardware parameters for IPQ5332.
> - CE register address space in IPQ5332 is separate from WCSS register
>   space. Hence, add logic to remap CE register address.
> - Add support for fixed QMI firmware memory for IPQ5332.
> - Support userPD handling for WCSS secure PIL driver to enable ath12k
>   AHB support.
> 
> [...]

Applied, thanks!

[01/13] dt-bindings: net: wireless: describe the ath12k AHB module for IPQ5332
        commit: 94fcd39ca255758335ace05f70365f2126190ee0
[02/13] wifi: ath12k: fix incorrect CE addresses
        commit: 60031d9c3589c7983fd1deb4a4c0bebf0929890e
[03/13] wifi: ath12k: refactor ath12k_hw_regs structure
        commit: 5257324583e32fd5bd6bbb6c82b4f5880b842f99
[04/13] wifi: ath12k: add ath12k_hw_params for IPQ5332
        commit: 5fa2fab69f59da8eaf9cbb53fd89727c750b14cf
[05/13] wifi: ath12k: avoid m3 firmware download in AHB device IPQ5332
        commit: 11794f8540043c230ec4bf57ee1227e765ab52ab
[06/13] wifi: ath12k: Add hw_params to remap CE register space for IPQ5332
        commit: 12070392be0b39d5305a235401d3ff9f03fdba13
[07/13] wifi: ath12k: add support for fixed QMI firmware memory
        commit: 6757079c5890f7168a9bc111b2345209f05ae278
[08/13] wifi: ath12k: add AHB driver support for IPQ5332
        commit: 6cee30f0da751284662affaa0d7fc567cdd65f48
[09/13] wifi: ath12k: Power up root PD
        commit: 10a355ba6238e13d196be2f226a59f7886d7b5bd
[10/13] wifi: ath12k: Register various userPD interrupts and save SMEM entries
        commit: f73e089745a000b6eb99457f71b47dc862ab221a
[11/13] wifi: ath12k: Power up userPD
        commit: c01d5cc9b9fe2673885db738ec8d2e01de169b92
[12/13] wifi: ath12k: Power down userPD
        commit: 881edc164071c2da3504b72fdc08ca8f1b915fdb
[13/13] wifi: ath12k: enable ath12k AHB support
        commit: c0dd3f4f70918cbcdd8da611811036a91b7dce33

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


