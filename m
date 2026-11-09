Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA7D606A33A
	for <ath12k@archiver.kernel.org>; Mon,  9 Nov 2026 21:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Es0cdd24;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VwSCCpdb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eEw1roXV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=; b=Es0cdd24oho9SQ
	heCu2uQJ3a7QVgNuTM41g0PrAJRgHPQVV0COVEcTEWSAPj99Lv34mMN0fTaIOaA3gUdoGyHmW/EIh
	xe39nimE/fqJV9JVWV8xKx6oUuNk2bbmUdsGBsuUZriQendLyAGpChmeRp6Lxan4NqMPZo61yEPdx
	zlP6lu+ITDCmtfxaN+axfvQhDRVfg4O66AWwyqYhkQXzrvUXCKgSXKGH56FLBjUtCqnv2ohxD/c9o
	icvttMQYfrIU1QAGkl0lzBMz2KqeoxZ6Vt/+E+7ilN9YOxkS7/5OIAJx1ovjVHT9otc/M7WNPBxjo
	5GXAOJIr/+5/S28YU7pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6z-00000001nVz-1buV;
	Mon, 09 Nov 2026 21:41:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQX6t-00000001nUM-2Q3w
	for ath12k@lists.infradead.org;
	Mon, 09 Nov 2026 21:41:06 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9LA47J870245
	for <ath12k@lists.infradead.org>; Mon, 9 Nov 2026 21:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=; b=VwSCCpdb+5zHIgyo
	+Bxe81Mk+uvMyazHf8ErYvn4v9fSiBZeM/u3UCJ+OSNqepR3/wr4818JrMIbzYcQ
	R+eJVaz2KZ4QJqLVbpV3so8+c5M/RsXcATSyJKan4wDotF19agsjLnbizjVRDTDG
	lD+pGm6BqHEZ91DYiC77+OdTDiE2/llrovvp6aoJXq37pbF76h4ldRhyFBw6Bd9g
	Cz+hG4GzVWGBfvxJuc81pVxtkoOB6zeg+G9LnNaYmJK4VPnhepfPN/SDgON7VHk1
	TdphtmBuwaGIsJHymSF0ehEi9gb5NzQEs0rLIfhRWb38u0unWhu7hBEpO5ulBSpg
	B+Ks2g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua58avv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 21:41:03 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so2332027eec.0
        for <ath12k@lists.infradead.org>; Mon, 09 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794260462; x=1794865262; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=eEw1roXV+NVRyX9iuIzCuMAkUECPCNJe4mF9Vk8PMUGiizLBnFbbu9vICHpoqYW7U2
         Tj75ZqI/XHEWAs+a+ZIjzp+mHtsLHe2MB3A7AkpupcLc680/Y7V9gf/kmIRc2JA5OgVf
         vPIKabiefslBqyoJzC4d02CLtmVmzIWfVjXr8QjHcwz1vql2CwZNPa02DZVuYDSjc6t9
         yQsfyIYWvdb1TB4VgtUQGkS1TsxHVNELjboS9JVEB9bPn5z0fnbe7QPMmq8u1nfAayXB
         nrD/ZFCb3wj271usU/6lVESNN5K8TlXDbwRTESsF5ODRXEm/2oqePLWLOA7gd7wTAdHf
         zR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794260462; x=1794865262;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nc3TzyXMoGJC9UyE5HrL9w+JlONNvlln9BnUy6v27Ro=;
        b=Ujsnqo5uWno/U02/2DVFRxtmNY9Z1QsUre4pHEz0bQ2TKuFp67HoNAD5x40OG2jjXF
         TZSzWjCYJp+94hmkuBnlv9nXWb3ljPmAy84He3K/9XoqJnzT9jFc7E/Vs0r7JtLvD+TF
         RgE8TqoFF8R1FZtMKKzzrQlpFwAmu+SQbJlxtUY1VW+VKoLfnQIz5mbGqwDIXh8Wpi3y
         c89U+zf7IarvDFPjXLLT5pOW5+Nihr85m527PLQswj3ctcy+v0vsvtXtZvyrtiVIa8Kh
         DKRmgR1ZMqK2F2UNDYALqBubYmSKUEH9MpzcZHGf/OGn/ZM7vmSwsqZto0+HOS5j8tqc
         l84g==
X-Forwarded-Encrypted: i=1; AL+hErFdR6jTRh9BOSTNlK1vXZc8JfPb2A8mscj350Qtd/oRYIAtRR/HI+HwF2rVkBBoE2m1Fkkdc84=@lists.infradead.org
X-Gm-Message-State: APuU4Z+gNZwqYGPCkxBlDovXJ2OU0BfgX+MxbD84z7lts9VtaCLV965H
	7xji7vXskaPAY91wE7rG9cIYsBUaThBgHD1YlrHMsBP+wgitI5HJkaGciWx8aIUgy792SLTA8Ta
	KfF+dZENOSqUBobWV6IbZ8EDNNa1Y8tRcHjcSJqFBvyehWyBTDQFXZGSL147FLewD
X-Gm-Gg: AYBFou1SbP6orbveah73FdWcYXYtB1CO+T7Wgdx5WwwGcqFt3Hdg+tQa/Ha8YtvYz+m
	e7xxTsLs785umSrqn1LkdSUMG5rD3PxaYQ5kHPo64RsUerCjY9HRGN/bdpQ9rcVXtBChFjEJKH7
	WpazjnyCinHUf4HGmHFD9ajp8RiuGrjKCJwasHFLSfqnjCkqHmZ5+OWuCsvMJkmlyPlQfAybdpQ
	QW5JABoBnVr1/dL0t5EKEgTmMZfdk3uY8EdFPb7kqn67eVucOevMOcfOzwpH+WYB3/UsFjtph0i
	0IbgsuXDSLh7IsmKKLzckIB/Tcmy7B4Y1mLzmYFIIl9QcRIvoAixPFbpI5b1HOK8w+l1l0B9V+t
	2BXDahqPQ2X0LjgTlTXwLYec9vUf/dK2U4nlAcB4GueJtqY7ux9hIdnC35jvYtYgANtb9sjgu9t
	J5qS3afUUNL7bmzh8JX7sagF5p3wA=
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571796eec.19.1794260462096;
        Mon, 09 Nov 2026 13:41:02 -0800 (PST)
X-Received: by 2002:a05:7301:fc0b:b0:36a:18d2:8c79 with SMTP id 5a478bee46e88-37520216c5fmr571765eec.19.1794260461408;
        Mon, 09 Nov 2026 13:41:01 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520512ec1sm989985eec.12.2026.11.09.13.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 13:40:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
In-Reply-To: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
References: <20261023-mpp-bringup-v3-0-19f3fcbf7b5f@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 00/17] wifi: ath12k: Add support for
 QCN6432
Message-Id: <179426045796.3811579.2501311030942871658.b4-ty@b4>
Date: Mon, 09 Nov 2026 13:40:57 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX73hpN5BkgjIb
 Lx4PqSKOWTya8ikdb8ltTCMVqgD2Cp4rKa6shsT+8U7aFfeZUJh0/ioOfy+6fu4GEYyfJdqWxzk
 m+zOWaqzddfBrfcSEorHZi3nQMe63NIBz+N8zSwSyOnam4UB2ffNr0gXYfFUybcjvJID866SdyF
 wY4AVUHQDyHqiC3JnrZVbrWUqiH8sovo5/N5BT9VQvTBPPAhQpQ0S/3hWJZcKjFPlqdIqoj+1ak
 vWuQ2M7DCQD+sAlOl5VjiDoQNBbfCWuvai/kTyapOHSLG6H1ZxbqqmXEDWSI620PwFQV81+eScW
 ULK1QImps+Xu+gTfgtJrYL44WM/K2MFagqoqwUZV0MRKU9AZlrok0huX+kvLhAi9febY484lomB
 tzRqDQThamPYLkzVZR+c8m+bcMooCneSlLfQzNFMOMsErSXvPU2KZXtJ8aWTmFDx8oTHOO1WRgy
 +c9JFKC3YXhxcP7GduQ==
X-Proofpoint-ORIG-GUID: H4Ch0jc0m9VDQD92BsBzYsIib8Ha02Jj
X-Proofpoint-GUID: H4Ch0jc0m9VDQD92BsBzYsIib8Ha02Jj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA4NiBTYWx0ZWRfX+8hAwzNCl60h
 zyvnjdq1vAr90j/8YKb9rjtnMioo3rx80AbihSw2LrcC5l4Bdi+gFgU6zykbUIAq3knjLsFKiBd
 IGlzLPcpVW21WIuR8k/8seuxAS7GFn8=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af23def cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oLphvwOYPl6AvyYkXNgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_134105_262845_ED40A100 
X-CRM114-Status: GOOD (  12.38  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Fri, 23 Oct 2026 12:31:03 +0530, Aaradhana Sahu wrote:
> QCN6432 is a PCIe-based device attached to the WCSS Q6 processor. It is
> registered as a platform device (AHB), and remoteproc APIs are used to
> boot and shut down the device, similar to other AHB-based devices such
> as IPQ5332.
> 
> However, PCI APIs are used for device setup and register access. Since
> QCN6432 requires both AHB and PCI APIs for its operation, a hybrid
> AHB/PCI approach is implemented.
> 
> [...]

Applied, thanks!

[01/17] dt-bindings: net: wireless: Add QCN6432
        commit: 42da6a0777de4ebd6a4841c324e6e53dca8a5850
[02/17] wifi: ath12k: Refactor PCI operations and MSI config structure
        commit: 7a694970c901406b2d308bd49cc6b62655795196
[03/17] wifi: ath12k: Add hardware parameter for QCN6432
        commit: 7b6c88854744df5b407b6e992cf105b8c73bee63
[04/17] wifi: ath12k: Add hardware ring mask for QCN6432
        commit: d4be9943adb7c04cea4f9a20c2b084be73acf15a
[05/17] wifi: ath12k: add hardware registers for QCN6432
        commit: 907079526eab4b5cce13d0521ce104e6a9f4019a
[06/17] wifi: ath12k: move multi MSI vector flag to ath12k_dev_flags
        commit: ea97a091f2462e05a6501a3bd352404d9590b274
[07/17] wifi: ath12k: Add hybrid_bus_type in ath12k_hw_params
        commit: 9b5a7ca569c98cca3e94eb8484d69d32df71ca00
[08/17] wifi: ath12k: Add hif operation support for QCN6432
        commit: 7f83e54fb9ebdc5cf2468b8f0c0fcacc4efdba0d
[09/17] wifi: ath12k: add support for unified data-region memory allocation
        commit: e67dbfad7a497ba62ebbd3be2d989f699cc3f7a5
[10/17] wifi: ath12k: move MSI config to pci.c
        commit: e40bb1f7504dccd2342c877ca605aa8f55f26833
[11/17] wifi: ath12k: Add platform MSI support for CE
        commit: b9bc9ef941bd40efa7503aa37b16bd515ea3b965
[12/17] wifi: ath12k: Enable MSI interrupt support for DP interrupt
        commit: 4efe1e0f689496268f74854515c0f211f5a579f1
[13/17] wifi: ath12k: use CMEM write for PPT on hybrid bus devices
        commit: 206da6eab6748d7989094c3babf320da60f9fa45
[14/17] wifi: ath12k: store and use MSI data per CE and DP interrupt group for QCN6432
        commit: 3f5a096554996ace4bdba9b942600d2906a942b7
[15/17] wifi: ath12k: Derive QMI service instance ID per protection domain
        commit: 9b4353d61a6dbc4a9c72831df2379979311a7911
[16/17] wifi: ath12k: Resolve userPD ID per device
        commit: 4342c7914e4cb181051524b43a297fafc2f7a9c9
[17/17] wifi: ath12k: Add QCN6432 AHB support
        commit: ffa3eaf61775cb2239d22a138aafd2ba03374515

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


