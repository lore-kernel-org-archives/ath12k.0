Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2A6CC6B1D
	for <ath12k@archiver.kernel.org>; Wed, 14 Oct 2026 13:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=; b=ZGEsxJKdLXCbJs
	YeniQqG4BbQ21haCM5KNr+MuPCtt4m3uvp8TGwWXy7kCYYaLLmIm64yLLMj9yFZZEprxmc3OlPPG5
	NR5E7qV+hl00DFliDgXjkF5c2ploJmID+S306InSNMEEA7F80r8wCtwAx45VzpeZKFuEhA2QFjK0K
	5cuZOu0ZQ486DXe8rVAQkFEg94zs/tdxAhz7nG5yHCq+iltZchJOZeUlFxMISI9TtUckrGMA+XRKc
	mcnIZ72fq1M15j1bregHgYfZ54EFoFz2KfpWUO4VKnor4zDI4EIsLpWIfk28YWGnUrFEXbSzrUQgP
	26vLELj/V7Bw/ePyEcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydU-0000000FWPI-1IyI;
	Wed, 14 Oct 2026 13:03:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGydQ-0000000FWOZ-1JAm
	for ath12k@bombadil.infradead.org;
	Wed, 14 Oct 2026 13:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=; b=Fkyw7dAOMhFn32HKy4kFZbC18F
	0gkj9cEACnnaKaIEvHSqLovwTN+Oddk768jemUk6vtfSw41W06P+jgGzo7Bbv3IS8mj+lZ6SgHZYn
	vqxx3ro4O7HQhGRM0zzbATwquzyRPXRgskTgzMIfJ27iDLB/2jwgtgSsvgS9GUpl0aE88azfWhuNq
	JSg0dQ3G6Aqa6CcFqqLHKA8sQ0Nn6LxNyYTpwTEmGj6bKm2+s96AtfnYV87jDCKV3n7binitG1nXJ
	NkoB9ENL5aeCWBc4aX+bgZ5JXaHqWQcSpY2uzaObaki4riZtJgK+b0q5p6pl/iJ/RBEWjpnVnkbij
	cUJB4agg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGydL-0000000GmmB-3aO5
	for ath12k@lists.infradead.org;
	Wed, 14 Oct 2026 13:03:05 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ECJQRL2088171
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:03:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ux7RAlOhQfXB+vgOyaQ7Pa
	ZBU7B8R90Yjj4MScRSDv4=; b=MjdQ1aBk5jFMTJ8Q9zDgopnG+1X6urbIQkCsfD
	NU/8nrsPFfSv5ZWPsIynz/thLByYZrTiks22vFPVI8PuQ+lp9GsLqlmwOPsS0tBr
	14DaMWndKiRSRj2uC0y7mqEAVRJaTUL6uE4KMAREY2VBgfaxYeuXBPuNmg+ge5vr
	P4wa20uNROToDVVzctdUF7xgrcwfOLe9iuKxB4QdEHPtQKLBNiIDttBi4aOHLWz3
	pIt10zgm7V5l7sZjPu4HeJ6E+vhbmfpv9Ajk3FR6ik8/HWBGJU/SWXpTuJmWhoUV
	klKV+0MWV8EGHtHBS2weBaui+xm+Ay8//ZADY0dIqcwY7vwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9x49jxrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 13:02:59 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e0a8f73addso4606626e0c.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 06:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791982979; x=1792587779; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=YoqbYmQMCT4YD17wd1ZvQn8bPe6TgQtl5jwQGdY0+rlsuxgy/WZ5/BBb7M5UzMBeOO
         boBnZ38kVLeGg/ofmUoe9solkcL2Okh8N3pUSmygo5rQOMeIjQ8aYRYBZ2Ts7FqN/P8l
         YXOFhnDclh7kgY1D/htitVqKIbwIAQNBL7GRwFvr1Quw/dcCTOTgU0oYOkBsxQwC3Exz
         0336cLMpnIp+LaLRH+bXP2hqDjTWd2wXs/t1wykXB0YwUzfPvC3xq3r5NhJw3Er8UOXG
         FeeB7ghwVG5eoi/s/H8Rv12OirU9jXYTy2lR9moS5JFsWudHz4ZDGIh4twnj5A2s5Bbn
         8r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982979; x=1792587779;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ux7RAlOhQfXB+vgOyaQ7PaZBU7B8R90Yjj4MScRSDv4=;
        b=jz5DqOalTXz3HgaDOzHCLGLYoe51B0+lMKjCJ6uavjbIvHKGiYJ06yVNLWRW/xc2to
         hsIIuNtgpLZP2Q/vEoOa1CsfigoaiVpkksRbosNxqdSmDl5a0ngCONKq/rf9zZIKI8Q5
         Ib30KOtiuKc7V5IETLBWYNjdKGrWeiaeesOLi/FZyXrQIMNIE0U7Tg+I7I0hYfuv7qkc
         ZbKensKPbqcdEluYbsnJp8bf0lY0W6gDhfoFU+oZe4QLvc71PGzaZJvWmT7P0AQHuqLm
         +9rMqsO98jqXqocT+ei0IgziS1rslzBLGm8kqCX4rY4vzQgGaWkUtO/RLqTIvhAs6JHh
         uPEA==
X-Forwarded-Encrypted: i=1; AKwUvBy91ldEtmZLANp2ZcyLXX8VzFhujZnp+zkeDPVDFxnZpFgo0Ka/EQJuHC+Kog/wSVEvTAlrhvc=@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6CfO5nGrSCVT8Q/1AYNNxjCNUtd69LPzoBgUIAxoOVsDiRg3D
	9YHxDH1fS9Hj056+8r6yfcPPYecd2E1PwbWeVug7B2Ia7oSOXKsxbQUYRySBMMwbd+plaQ0n69e
	gSf1znytHzwxqtVOi6pFUQAc5DM32M9xaThYX0QWBtsCbSL0+mJK/XWSf5QzaPl0v
X-Gm-Gg: AYBFou0A5vOfKzNkNCMyY7MBZ//owYDIWmcA0tNiuz3t7JNN3WtOhcnL0LQWrX90wCs
	HMhxw2g5CjzA4PUJFx7z7viwAVtUQl0fYLHJnhpElgdrFwDMWx8dT9JzspZB49EqImp5xzBToG4
	jsAHx+9yQVPyLP/1ApMtq7Hb2IJKMaOIJmVTKTi7FOg2Oz/IPwLN9JKzsjt6pOGiKKuNPRpyxp2
	/Nx2AYgqa9Vrt8trZ/amE1hf+ZIJ33XAIrZgrlrBCFg161JAN2z7wQB6kqsknPOU3YzDizigJfl
	FRVYa1ujG83O641iYKKR5LFqV5CoCpZTtNHhPOTNDKg9rWfl559PJvrutWJJcm1UvYvCRyEUWzM
	XzjoLL9cWbQ==
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314166e0c.1.1791982978550;
        Wed, 14 Oct 2026 06:02:58 -0700 (PDT)
X-Received: by 2002:a05:6122:32c8:b0:5c9:b444:7afc with SMTP id 71dfb90a1353d-5e91f26d597mr5314129e0c.1.1791982976482;
        Wed, 14 Oct 2026 06:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcece106sm567795e9.9.2026.10.14.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:02:55 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH RFC 0/5] nvmem: Add a UEFI variable backed NVMEM provider
Date: Wed, 14 Oct 2026 16:02:38 +0300
Message-Id: <20261014-b4-nvmem-efivar-v1-0-187c85f65018@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG59z2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MT3SQT3byy3NRc3dS0zLLEIt201GTj5MQkA1NzU1MloK6CIqBEBdj
 EaKUgN2elWIhgcWlSVmpyCcgspdpaAOHta6h4AAAA
X-Change-ID: 20261014-b4-nvmem-efivar-fec3cab05755
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2683;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAIkzzbj+i1WmP6eC8YcuDBzKhsL6Sj8KUpou2Ontc8=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqz310HD0lY/yh7SQXr+ouDyDiI+jw0Q581NH+F
 JEam2z2hIyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCas99dAAKCRAbX0TJAJUV
 Vq15D/0QVlTJir+agRbJm7HC5e0xE3vUhkeQLvsNriJkdZ1tqKjcyQ+n0YkwbN9hLa0QYWFZZyY
 OqYitq5DGIO0suxwwX/XOw2o+Ow+l3k28aLpit/w0QPwOjKzvRjHk83542VZAuhjxyFqJLKLUx+
 K9dMFA12PjhKgsuntHrs1uYt/Inj7Jkl3DQJ3j9twBTgHg09NHJtwzIWGXwbkeh6tbQDVLp8HES
 KaOrAs4GriNIjx+vz9xdpcX4Hb4/RcDSDcD4ByaJ8zXZy4TT5Q6y4SlqEkHTKE3FS9jpIt8VuxW
 fDMly3YtPOJRiL5/FyVez4F/rivUHkGfWeaQECiUUt5lYvqP8e5u9i+Yjglvac6bybOEvn6mFFl
 ILYkJH1xyrcIQ/xDMwzeEYU/QEaYnGA567CBIEN3YRuMHG6g1NdI3Jnb2K36TFdyJcaoWFeiiVj
 oDM1bLYAN2ZxwRykR3gouXB7AMcsVK+7JPYtie1nI5ktBkEvTHUqRWeQmKw0gPdFbk2rXh+mLDc
 wYISR4d9Hkwgoc6C9C/T1UZbM1MpYLDMFB2rczHTTmBXlHrvi1hLGQ52IbHDKQmgEyV/RSJzUfG
 PIlLey0I27FkXIMhY1T/nLodKHy0vr6oS6ELYmznE91cSCPq0WkwdeTZwnx0brjBoGrgLDeChzA
 O+eeON62CtBFnDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YJcKWhGx c=1 sm=1 tr=0 ts=6acf7d83 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5qUZDwqhos4Me9Bi-QgA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX3hDHEi++P7CD
 AxX6HlW/ZjuKCNkQtoAZRaHJ/XayTcZ+OwBKFd4b41On6t3rnglpDXQq9z/trCfVg7ilf8Ac+Ks
 6k18q/54X9lTseAPgcCBzTk/Le6UfBHFJI2u2z60onqVDd2OdjKaGOb/Gw+LrhaPuzA1w7hsjkx
 0d9jDxMzMxjH8ibV7k2kjSCPAg8AglWp1QifPaf3s0e32yyQP0hrUFf1EzcC4buG6xPngvq7WjX
 rtF/jvqwzbkWiF4uvLrTQFkKD/H1s9ca8rZK0LFvluJB/xeuH703YkRt9QvWd95tFH7M6BajZ8Z
 Ya8DnpUyXVGZCQ4X1w5na3Zpi3JxOxnUssQPc0anskJPV5DVYr2DIXg0l2penvX+J2I0tX2kMvl
 QLBcMptkbwZom0y2bBS8GrNaByWjKIUsEVEP9E7PJ0l02LAQ/X+SXNOYvU53Rhd6YECwNTPUQoM
 ZiujhOeGhniMC9QJQ/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MSBTYWx0ZWRfX5Fv+bx7Hhl4S
 obqX/k0b7aKSnLVb4HA9DIHyIxQqXQLcnNCHuAm7R1g6718lky1QWUQ5qe19KuU6rowh2cxmVrT
 TLfWzgVTtMG819eIepF7CdnmvY7QFyQ=
X-Proofpoint-GUID: ZCjRbXQoOuMvyLsG7E8OwY8TiJ6_1WF7
X-Proofpoint-ORIG-GUID: ZCjRbXQoOuMvyLsG7E8OwY8TiJ6_1WF7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1011 impostorscore=0 malwarescore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_140304_300277_452C368C 
X-CRM114-Status: GOOD (  18.11  )
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

This is an RFC: I do not expect it to be merged as-is, it is sent to get
feedback on the approach.

Some values a platform needs (for example the WLAN and Bluetooth MAC
addresses on the Qualcomm laptops) are not always available to the kernel
in a convenient form. They may live in firmware-owned SPI-NOR storage
(e.g. a DPP partition) for which there is no straightforward, universally
working way to read them from the non-secure world.

As an alternative, this series allows such values to be provisioned once
into a UEFI variable and consumed in the kernel. It adds a generic NVMEM
provider that exposes the contents of a UEFI variable as an NVMEM device,
so the data can be consumed through the standard nvmem-cells bindings.
MAC addresses are just the motivating use case; the provider itself is
generic.

The first two patches are the actual proposal:

  - dt-bindings: nvmem: Add UEFI variable NVMEM provider
  - nvmem: Add UEFI variable NVMEM provider

The remaining three patches are included only to illustrate how a
consumer would use the provider; they are not meant for merging as part
of this series:

  - Bluetooth: hci_qca: consume a "bd-address" nvmem cell
  - wifi: ath12k: consume a "mac-address" cell
  - arm64: dts: qcom: glymur-crd: wire both to a "MacAddresses" variable

glymur-crd is used here only as a convenient example for the consumer
patches.

Feedback on the provider, and on whether sourcing such values from a UEFI
variable is a reasonable approach when they cannot be read from the
SPI-NOR directly, is very welcome.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (5):
      dt-bindings: nvmem: Add UEFI variable NVMEM provider
      nvmem: Add UEFI variable NVMEM provider
      Bluetooth: hci_qca: Support BD address from an nvmem cell
      wifi: ath12k: Support MAC address from the firmware node
      arm64: dts: qcom: glymur-crd: Source MAC addresses from a UEFI variable

 .../devicetree/bindings/nvmem/nvmem-efivar.yaml    |  73 ++++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi           |  22 ++
 drivers/bluetooth/hci_qca.c                        |  48 ++++
 drivers/net/wireless/ath/ath12k/mac.c              |  14 +-
 drivers/nvmem/Kconfig                              |  12 +
 drivers/nvmem/Makefile                             |   2 +
 drivers/nvmem/efivar.c                             | 273 +++++++++++++++++++++
 7 files changed, 443 insertions(+), 1 deletion(-)
---
base-commit: 1fffefb00cc0b0da1f2ae24e3d33364530ea6515
change-id: 20261014-b4-nvmem-efivar-fec3cab05755

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


