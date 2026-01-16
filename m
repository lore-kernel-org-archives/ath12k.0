Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AB6D4A5E4
	for <ath12k@archiver.kernel.org>; Fri, 16 Jan 2026 01:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0/7TgnXglvXHpjdE+gHZmCF1bpUq+ROebyvEVwJOBI=; b=ZoMKYIWcBeWmpxjVWNY6G25dCe
	cbobIIznjjBTH6mhaN/wIJqMptk0qRLy943hchCW33NEskjrG8qx8g4p+3tp5ZKb5Z0BdrBj0Z53A
	6HHCaJ4GLx/TNTMI0AZvuVsbgFe2thDYjKEgZWy9vUphsIprQtabX2WBxk6utSqLtN0boMLpouBHT
	SjjkbyWuKWxDLtj7IfSoKL1ZDJM6aJF5eDWzlxQdlMZCObKXpxpxXw2NAnq9Do0bFcdyhkSZHhzzH
	gFt52pmajQpSV2LAKmfE9PzM/qnWqrqilTsgoWX9QxxiXvRNZIx1znqJGjqJu0A/5L2F+GIez9319
	+RuzjISQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcH-0000000DQ2W-1lJY;
	Fri, 16 Jan 2026 01:27:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYcF-0000000DQ19-0bf5
	for ath12k@bombadil.infradead.org;
	Fri, 16 Jan 2026 01:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=u0/7TgnXglvXHpjdE+gHZmCF1bpUq+ROebyvEVwJOBI=; b=MjyTz79MUg+9tdKb8NUnI8744X
	LqLIfqMYGsFVWnzAAtyNeITz6Oni2v2wbIUER594cub+bZQUvYfSgaSPkiT+PsFtuIA8i6t4YOKb0
	HGnT0pQGAJSJdKnyicEN5EPda7Q4Hg5k/UpsVLXSxBugUTqKbA7G4yJxljykk/voEyXus/2YR9YiK
	aiN7yef3ZMXb8pgz4ZhFrGhg3a4OHzqWSep4JayQ0AwCQefkIbnmGdqFTOmIuQGJ3leqgtPaxDvGW
	7kOsIyA5rEfkHaixerJeR9OUV+m54RYfi23ilnGTd33miMoxGanVv+71yOGmTlpioB7Vm6rPUqoz7
	4Rx273jw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYc5-00000007tY9-2bmm
	for ath12k@lists.infradead.org;
	Fri, 16 Jan 2026 01:27:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMkkTm3892781
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u0/7TgnXglvXHpjdE+gHZmCF1bpUq+ROebyvEVwJOBI=; b=aXblFprq4XNaMmu1
	Cq7iHkjmOHA8vEIhqypMZx9zOY9yac9ZNZ+mGrbng6gYtsDHRGOeS1dg6iFki9+c
	5GIyLorKt2V+5VU6LkxIV/v4/CTiwm0FVlutLbcHWZxfriYnEg0hoDg74HVl0ptu
	OO1afqk07NXEVampZeBNNiS9N6FeeH43oomgRd31NTmR5rtt6ZhEGPPtGo/6RmYF
	MNnWs5kFvP326F/0J+OGu4py9tn6Gc0iUbdcVcKXu8SIX9MIdAZAKxfUHgcb43Ol
	ljR9MlXm79hu0dPBSdeThQE+s3KsbqYVJH5mNEKxUVVoa/MUVtBBOzcp1wxDuLOH
	oG4ZBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq9b08ajg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 16 Jan 2026 01:26:52 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b47ce772e4so6399091eec.1
        for <ath12k@lists.infradead.org>; Thu, 15 Jan 2026 17:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768526812; x=1769131612; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0/7TgnXglvXHpjdE+gHZmCF1bpUq+ROebyvEVwJOBI=;
        b=iir/FQMd4LEq4klNnyVXhaQ8dsiL4j+I9dzQpWWAfKCj9bHvax+HOvMq6Nu63epijQ
         lnGrW8vi38gEeuogROKFSvWjRjfsXphbcrd+EhjTbULQ6Mkc7yYLWoRvrvpIBVkwr77C
         fzEuecBzxuYxKP/kjOd3UTb5I+vtEXyiPuctCjmNYFZ28PxX2KOMXRWbVRXkq4B36l0M
         Ky/llv3TIlwErwDdreowjmVR7l/ZfY26LFnBz0jjyliG7m/jeBVqxrMoxWSCH0jyeTnC
         Hkk5Tnax7U63rPF679u3dE0F23GaGF7SIJ8TsGGj+NL0v/8aZNJY/JJvfYCbYH2pzD//
         qlcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526812; x=1769131612;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0/7TgnXglvXHpjdE+gHZmCF1bpUq+ROebyvEVwJOBI=;
        b=Ez4NQpaLwlS3pqle/p57dOMKRI0J0Vvuby1XyJfdiseGz6zM4tbuCTp9p2CvgMlnhv
         nbO9HjczD3DfsgNoLPeXtFuCnZ/nI/pn9CN5IePyOjDZkHlA5wSMKUiypi3qSHUyfs8M
         PITUPFrFnkS3v1U89xQ0G+/p0G9kopoWxKb8kAWIVZX5/gDKJdlfAn3QkWshzuPKs6H5
         SlbLKzNxiKFARxEANUTtIRJNAzHi4oB01mxNDJYR6TKR2U5EHs5ilPYLdHI72n74N3Y3
         vNPATqlz012a3KAG2bw89u6mLCiIEVCciDr9ZOqOUHWKRo7sdPqL46ROmxWqTC3eHrZz
         c5Vg==
X-Gm-Message-State: AOJu0Yy+X6QjrSxXknQSsodCuqvXnb6w1at7q/RhLWUpF1SvDjhb+sHQ
	qIm0gpLaZPkIoJSpn5PLQ/nJaFKPaeKpkYeIMkE1+eM8HHRVcmNSX8aGpl5Q8unYYLzUgKXhWxG
	bfT5CKGHS1RYYzRVZePire5LMxB4cD7d8U223mJ/kIFQwE6+/4iBrpyUTYvbtAYxOc3AIqBmj
X-Gm-Gg: AY/fxX6IUsS13b1QoP6OGY0cMyV/Oe4MCO0fGsc0PsZU/+cgKblReR/5yby6o8GspS1
	BJARrN7OcTodXNqfpBBnFZyxxrqY1IPylNwqJXRrmpvzjbCbFS6RknHig7pK6+TKlt95hRyNpFb
	YlK/B2IfpcKTsEXnxCxfH0+B4SzaVDQfY6MwiNYhkIUwhejjh9ip0zTzGyxicEKFTrZK5dFAYnk
	P9chP5iiC4pNFXf9W041j+YfbxUlmeKfLx33yTfNhwTAZMWz/y3b+3XkIfLO1ujtfn25NoJYig6
	BHg+pNnK6CDCGOLbSp/MbVLFJVcxtPOU/FQgv+xG4v0m6GWOhz0kPs/ii4WE9FN7n1IwR1P3BNP
	8Xt1kUqtEM6sXNzIExlMYDX+Z1CwrPVCMnQZgmhr+ZJwwH/PLOvmaSKr7tYflqfbY
X-Received: by 2002:a05:693c:2c8d:b0:2b6:ab62:ae74 with SMTP id 5a478bee46e88-2b6b414a149mr1122181eec.35.1768526812004;
        Thu, 15 Jan 2026 17:26:52 -0800 (PST)
X-Received: by 2002:a05:693c:2c8d:b0:2b6:ab62:ae74 with SMTP id 5a478bee46e88-2b6b414a149mr1122168eec.35.1768526811361;
        Thu, 15 Jan 2026 17:26:51 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3502c91sm884104eec.9.2026.01.15.17.26.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:26:50 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Chien Wong <m@xv97.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20251030143041.12027-1-m@xv97.com>
References: <20251030143041.12027-1-m@xv97.com>
Subject: Re: [PATCH] wifi: ath: fix comment typo in monitor mode handling
Message-Id: <176852681078.1143034.12947197593422605136.b4-ty@oss.qualcomm.com>
Date: Thu, 15 Jan 2026 17:26:50 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: UVCzdbauU65gAM5cd5TcYrPq7PXDPARK
X-Proofpoint-ORIG-GUID: UVCzdbauU65gAM5cd5TcYrPq7PXDPARK
X-Authority-Analysis: v=2.4 cv=TcmbdBQh c=1 sm=1 tr=0 ts=696993dc cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAxMCBTYWx0ZWRfXwGjRyKXC9iqk
 29DGXWpXvdM2w4HkaA6J+liYLl4uxqsJyXqBQCpy8WQsR83lOGFvVhcCFErUHoghzup1sPPnDr8
 aIH6Uc9A4hzds2Bed+SfWVgKwdDFgjs3cGDLgPtexYT5T5AIfloPsj5XjrsbFuZt8RyqqjNx3aV
 MTFgqFZVNfVTSvj1HesjkHwVgDqDFlQODLObNBFubUEXEeYFYUuJiYa1ppi2dJHyPwUQ/3nJJke
 KNtf1NMHn8gICxYTkZf3pqieD8syegbc+QNNIVNGFojhSJXlVuMxK8ds1GVXCyAl8cvhDcyRVmx
 WlvAAFxtVHyiAnbfwCAzUHSs4QTzRqFvVl6gLuJvoKRhqa/UlLs5zTdgM2oCb4Z3Jn23WKP1XKI
 WJ6Mz6nu3iOOAsAxPBlot6xjXUDEJJUPWYL1B276cjYHn6hCXLpJZG9eYRHU49OiVFY4lQttEVh
 lbY4iWldBt3HTOR+toQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_012659_596902_570E1B1C 
X-CRM114-Status: UNSURE (   8.52  )
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


On Thu, 30 Oct 2025 22:30:41 +0800, Chien Wong wrote:
> Correct a typo in the monitor mode comment where "it make" was mistakenly
> used instead of "it doesn't make". The comment explains that the brief
> period where monitor mode appears enabled before being removed is harmless
> in practice.
> Also, use more common phrase "in practice" instead of "in practise".
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath: fix comment typo in monitor mode handling
      commit: 9269caf5a7ff2c0b1f37e06f10eee68d5bf1049e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


