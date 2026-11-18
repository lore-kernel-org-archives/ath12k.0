Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86B606A320
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZdHuZv47;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ONQbJO3t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gvf7+6HJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vjtgjTiFlvMGnI9sytM9gjMBhdXoEoK8R2nHFASGL/c=; b=ZdHuZv474Z+MOu
	o/SVdU7UXltf328gxGrcH8PBctXcOWGf3Yv0QIkJ8wyehqnQ0MZNAaebxIDK+ucP5iq2LlJr2u61E
	XMsL1ty17oKZgGOYOKvuKHhLpXD6GjPz9o0tL4bTs9WPkIXrFZm+3UWkwl971vKm8kue+KLZYYjeu
	Zt9SFEBmHoTEnLSKIGVnD8y5/eDFknSiCVrHszkpyPIZCQqMV2qSNcOFg41IVNy77PnkNXW7tUCNG
	NSzA2fUjK7EA8tXhX7ewlXaOZsM2K9NjCelUwsXXOPkXytmO0Ajmftq5CnhB26+TBuvWKy9qr9uni
	WRQPh0HF1MAfMu7joriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1W-00000009eoO-2093;
	Wed, 18 Nov 2026 17:00:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1Q-00000009emv-0tqd
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwqQi1113992
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjtgjTiFlvMGnI9sytM9gjMBhdXoEoK8R2nHFASGL/c=; b=ONQbJO3tKlGIQl/n
	aUnJDhYKMz01bBsKWfA8OmpaYS/VRW6CV8KePxiScBFMQh+Ix5LMqpmLjYyGajVi
	uSFpFk0uJHXFKJALgDXQNdDlnTDscinSrMYloSz+eguEUvES9IKLTodOnxr1VlHH
	EiVJk4ZQ5LmE4/uduvnwan/RaGm89RK9WD/o8SGZQdHkrDBGOlqBdbWEfA51Pm1n
	VLTWkpuj1Zm6z+H84RI7apEyCjKkkJgJyCPT7w6Xup++PX3FyYrAVsuURE9G6DiH
	Yx4Faup5CklXSXTZdFUMd1Ez4qkoBJc3fIBaDREitmbVOD+jxLN1M6ruTT3hiLlp
	vHmhXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8v3a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3afcaadeeso2011c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021235; x=1795626035; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjtgjTiFlvMGnI9sytM9gjMBhdXoEoK8R2nHFASGL/c=;
        b=Gvf7+6HJrWP4A8k6ZmqZ+mDN2tJXFg71li2t3/AfzvE4E5UkmLwCvf7Fxvgs8zz1Pr
         7l9ZyaSVwSpxOuyKIlVqAHotkLhYqD/EVKR0D6ZlwgUFvHRT0MVNYvq3lT0MAkXQspdv
         WopoZFNi1aI9tCmaoZRISbTuVq9yezniVI3JY9emFbNqJ/3mbFeZCwQA1py7CkZqtCMf
         LesiHlhuaD4vzEJeLwy8hYlf1Cc5j60jwdDvxiP8oB60y0xGb/MaSlFfiYEF4km/w2VU
         CDvpVf5E4KqdFH5HIiVWDyvaTqmZD1K9tTKhVYrKUHenOrDi2VypSRzgWVpuSnCw5BCY
         IPRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021235; x=1795626035;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjtgjTiFlvMGnI9sytM9gjMBhdXoEoK8R2nHFASGL/c=;
        b=W0TKHcPQXho9Fak4sUC1BR1q2StzDT+h1BXk3zMxPy9QTVce7oaAMT9UhINWuTbAD7
         QK5wWtx00uYtxJqh0AopHZtBkOwZjve689y9Z877vGjhBJkHMC3GYzaK7vyo4hcsb8IQ
         MF6pXZTe0VSO+FiHOk9c6FDIP7DfCXraj/waCznUrtdz3hlwSiLhwGdJXifeiYRgodHV
         MHUm4ZBMOBXsW+fSZTt0NstKKzJxmYEaMlwwHpQGe/hlLlHPdOsUwKseerpXv9Z5hQxK
         kupLhj2pE9eh0g58yEI3NhcUJrpDTbSOK7EwIlohcLp87uzyqqE+vLMOYRIK7/H1Tbx0
         ZNZg==
X-Gm-Message-State: APuU4Z9RbwxFRU5aJfR5jwLbrdYMHghqUUwgLT04EJjRfqzeYriqfn29
	BmWIirE09IH+p8xuMTeoAPswwn8ft136s5hKxD4xsyY03GwGmxd9jBiNoez5C9MRJSFF4g27XBU
	y7mZaSaTLfcsDX3qta2YUT/RgOgDa1Tr8c5TwJc5cppeyIEOUr+YmlEt1YVM7NCpN6mxE2MAm
X-Gm-Gg: AYBFou3HhJd192bfRLbROwIreEYvOJjfn1ZEdQ0VJKQwyG9zJCVas4S9BRo79QTdrTa
	9gp3teWUgHATHw2lJP6h3iaAsqeYqfHLrNE2pB1dVY5K4TjWUOtZZrdXGQ5ZhPbRrws4U9CSpgg
	ArTx3jinshs2eocKhSZNgT43tR21nDBpeHP1Mws058FMS83I+Vi5qs+lIflM2H7D73lxKsWn3Sa
	QqAcH0ey3SOVJR15aCR9iLSolCaXriXE0wAY3IUpI47y4dDYA51xpcCXrn8Gf2rPZb9oxIdRUpl
	jXvAdgBBOlyv3ltRhD2MfI55qp/3+AEcZfKbS7ZRFBVFhjFWu0Ue1vQOIBP7fx0OMVeyPmLP3A1
	+FWeidthg4st7NyhZ16aJ7X3xSBY97m91VTFlLp63VasBsdAD9tqKaBxIVoiogcFrE/+34eni77
	daJ7aHnDCdllsqoZxc2G8RefLqA+tM
X-Received: by 2002:a05:701b:4203:20b0:1b2:6b17:28e6 with SMTP id a92af1059eb24-1b54cab70famr73771c88.9.1795021234533;
        Wed, 18 Nov 2026 09:00:34 -0800 (PST)
X-Received: by 2002:a05:701b:4203:20b0:1b2:6b17:28e6 with SMTP id a92af1059eb24-1b54cab70famr71761c88.9.1795021197575;
        Wed, 18 Nov 2026 08:59:57 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
In-Reply-To: <20261118073832.1261471-1-yu.zhang@oss.qualcomm.com>
References: <20261118073832.1261471-1-yu.zhang@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entry for Yu Zhang(Yuriy)
Message-Id: <179502119680.3425953.7826982551506112184.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:56 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Authority-Analysis: v=2.4 cv=Eu1HPicA c=1 sm=1 tr=0 ts=6afdd9b3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z6miPcxbUE-T0EDKf3sA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: DIvpYj2qypwTpifmDGlCY25zkvquV5Ic
X-Proofpoint-ORIG-GUID: DIvpYj2qypwTpifmDGlCY25zkvquV5Ic
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfXw/FxBLMwa2l4
 pGOZi4YEcl+/aCSe/1Ro6H5ueUdzqefvuqs+bOI3Tf/JIMOROd77cbG6u8PCL4DcBqCPrPP1Czs
 KvaJQr/WsTdKqxI0HCJfcf9e+itV0c4pNZFFEklW/QzkzjaoId9QXkJcUgAx1qho0FslP1JZAcS
 OVLTG3mZwQ4HbR54iyiDkSWNfHZUnBiZCiBpRe+g9BKeVqskMN+Qi4z0XyNQryRQVOsORhlMyZJ
 FyIVeKuM5noGn3wkyM3GsT9QnYAbSHGZVFA33rZ0q5dvgQI7232O9fc6AjP2zfCOGXHWL9qGKuf
 o4itDFyNAh6wqxDgyQKNWnd8kIuNTzNIE05QnFDf3iDyWoqISMRv2XzUAP3kgExOU3KPoFw4JQU
 AevaQ3RFr3odhcsRQ2LRDiJB2gUs2VJ0Yx8S1gG5a1d7m+q8eqgEryxG8LlXT9HRE+W0nDCns53
 gVVfjxLAtzDPpdLxSjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX//Qw2QB8F2aW
 7rpD3yz7SdkeHgFKTx4IqxzEqvnTlB6ZofbaEt/kOjAn3fq5lTIgLUWLBoGQwFm5bcIjvmByS9Q
 DJEEpkLyr4Vfcoxkm2tN83+ghu4BQkQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090037_874975_BF45BE33 
X-CRM114-Status: UNSURE (   6.20  )
X-CRM114-Notice: Please train this message.
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


On Tue, 17 Nov 2026 23:38:32 -0800, Yu Zhang(Yuriy) wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entry for Yu Zhang(Yuriy)
      commit: 92039549ef78238754c07801e4f3561153ba64d6

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


