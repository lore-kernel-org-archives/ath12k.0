Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB593606A32D
	for <ath12k@archiver.kernel.org>; Mon, 26 Oct 2026 06:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p5JfTAGR;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Igk+3iVG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Nip6shFM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=p5JfTAGRtdADKv
	9lIB28zBy9u1LuPxGvkBeODwvzqCCY2s2NLczljSH38Gtlkm4rY+dMP97R0wSUuN4QsaczSa58UuF
	AcYqkoUHEkSA29VHoIbQZvOnVMHpifwNnlIssEgle5B46sbUyRqfUviq4LhYNz5OjpVhpw6rQcUTi
	vPxWVXC/uuQUnIh5QAydWkYvXMg6W7FhbygHeiEkYSMln909pCtzAgO+XIPlzQtvccbDGelZvHump
	lM2LG3CCz+6PcXRCLsSyb5a7w4Ig0Ck8fKNO5JGxegN/rKdDr7qimmeTsjaUA+3uc+OLyHS9+c3c8
	yFFHoLsbwg/Av66hB07A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLE6k-00000001mmF-2wdv;
	Mon, 26 Oct 2026 06:22:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLE6i-00000001ml9-2lKE
	for ath12k@lists.infradead.org;
	Mon, 26 Oct 2026 06:22:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b4sE1340428
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:22:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=; b=Igk+3iVGlbz5b6tB
	V0gA1Nrz0Jly4J1OoNE4xjoJzvyRPSUvYvWw5qqIicKvSIFMpsef8xt0gCj8xm6u
	m+3YAe/99SqF4IOPJYeMV3u2Ko1V4qRB6G2Y+eMGuU5FssFwDbDQYNrc36fCvlYc
	O0BbhCKv3duQ+abRD280UU5h5nx3fFj/1/w+yVP+P/zvM4xQI18VQikn4VPcPZGP
	nNEITFedz13srfsp0fnhIfkYyy5z5Y8hYyDCG8prtOzLpxBgNC8oL06RDGX2Qody
	DkZl0Q1IRZ6f5nDTmYLGJMLnUFa7PLP0gfiyQh+/vS/XClLzwNAIG136J9NUOcwJ
	xlMm5g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgny9vw6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Oct 2026 06:22:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so13942332eec.1
        for <ath12k@lists.infradead.org>; Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995775; x=1793600575; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=Nip6shFMdqyUqfl8SP3oVAaPUwgOTsC1E8ggNZRnHW0VYiwO5PtRg7TWNVCvlnKr8G
         MYOgQC79axtJ/tLS2IKlQUuXPvprbxsxYJJsI6BQJuUtgwLZXaX5+5dl4Prz96X2TNdb
         w1VY6rOSTIqe3sWIZex/mOQPwkxsgXdUSA2TpdgZNrGr9TN7cIdeuzfHynOp4XZRhKj5
         yNQVFx3DlXvRv2fVL8zrs8KGaNF8UUiwReL6NS3D7wm1ok59E3F8fuvmUuv+L/8tBCpe
         4CrweurLbbCHsn5vjB41j3M04VbcdVY2nSSafP/aP40KfNn4p25JPCHcJUqGAhzqDxay
         Pllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995775; x=1793600575;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRGzkDJlyaYo27YOEoR3qSlvLhrXH7ug7jX2UAfMTGc=;
        b=qnNZRWJRMPHDi0zIfkZVlBtsLSzntoRC3Qez/7y5I325snf98Od5PgdNyuHAmn2YX1
         2g8VBxpVP0Y51apV4bTGT/sMzTPQ9v/Zv0HmLUMOyZUpyyLg18RynuqRp8o4iH9onspg
         rkXQc+Jg+LaaRNQmZm08cx5bM/LBmOkr8QT9PNZuyccVqlPmVlA8TH+Jt8d2O9+4qYOW
         CC1dm5cyqYXXN/hcInqN4ji5sBK/19BoQK/E9YVS+UDFC5AJ5FWdmNMU1RDvy+2gbRBH
         0wkHAYoNdQlf40ds8aAcmrYpNMbeIidPmdLVUPrIB2JXdHMH7IFXHxSzXaEFiFdStKPB
         gudQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVXQmuefHeFS1O3uQZc5PPbkjfwncrqVdrkAdCXZ3yQZwcVGnZgwkKad4XuBHxs1gB808LKVQ=@lists.infradead.org
X-Gm-Message-State: AFq9FYKtK5j6fGMq5oAD8W4v19bVJXT+pyN8/wgI/HzQlSmvTBdTTqMn
	yp8gL/wGl5+O9hhKvbYJWSB5gCHba7e4Hx6e/GqkllT0EcqRkcRKaIuVuPQvk4HuDjBeZ2HFjcp
	PyCGFxAhlSviIdWG7UuRaXjfcwsClBy4tnv4huJQXiDnIrBlm3u4PIv/I48A9rE7/
X-Gm-Gg: AYBFou2r2VchYpZ8LecXTXxG7xrGM53bGimhLS7NoN6Z7chhcac/EIUsB9carBDRA9J
	oFSJzi0BUCZam2j/QqNu6sBdylbFHwOEFz/blp70gX5EccwhLKf5XDxATv6w1QKvqaCKUX8Y25T
	aNdbfxLVh33ReBTGLc1gHuL3ZXTvCzsRHx4S+doknuTquhKJjCpcfGBoRy6faJG8QK7K9qwIR+u
	Vxy9Ejd3gtwNX8IcKuJcoAnT2cp+6ImPltMVx5hcSvVcCPTXspMSf/OcrxkMhU220ShtrzCe1ft
	4bVnZGqU34kPgGpIIhOBdk0YBRvrEE22NnoySn0im9IpiSQW1bUWachIU7m9igSokWEAJcz8aFy
	+dWgMq24yASqiQhHXFCEf7rKV5uUicYG8
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204917c88.1.1792995775074;
        Sun, 25 Oct 2026 23:22:55 -0700 (PDT)
X-Received: by 2002:a05:701b:2405:b0:18c:e014:6f1d with SMTP id a92af1059eb24-19929a9e465mr8204894c88.1.1792995774577;
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
Received: from hu-daizhuan-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a2a5a515sm19719783c88.19.2026.10.25.23.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 23:22:54 -0700 (PDT)
From: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] wifi: ath12k: Connect to the QMI server belonging to the MHI endpoint that received the packet
Date: Mon, 26 Oct 2026 11:52:20 +0530
Message-ID: <20261026062244.2875432-1-daizhuang.bai@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
References: <20261022-qrtr-multi-ep-v4-0-c6fdb75fcd3e@oss.qualcomm.com> <20261022-qrtr-multi-ep-v4-4-c6fdb75fcd3e@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qHGMQfX3ooJuAeR7AHo1Y4IzyUHzfFd_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX+xXIIVY+IpMN
 TArrubJnbu6gCPTeXLic05ihhPTcLhFg9dHccfUStx3BUmz+a/SoB5SXG/CkPFWjd0bi/UqxD2x
 T0c5cW5OU/Iyd3kiX+12Yji0PXsLD7QFfBEJFDzfCYAe3rruQoCMtpxSOKEyhiAQEZlDk0u+yJC
 CC3B5zq1r2Pv5/wOTliNRwZ6u3zEup0PP3jLFnzKpK4Ik9xw7p7LUf7Xrdq9/YO87swqcWxuOKQ
 4bOFjFswEjdL0XiM1+4sTslf7IBY1tD5TDjJ+rnke8wa64Y9w0nPTn0qxDfuNwWFzu4QFParTaj
 BNh8dnu3FIQ++uEoOBvYeOw1WdzqdCOSDpWEHpA9JmD76taeCawA6rMSyEZ5IOA+didnC6gQx7F
 0vWKVhL5kZZrr/MGEqMFb+dXtF40RpzQMYF0B0qmAstSM4868JQxJ6haAPx8Sy9W1VDxyn/rZl7
 RAA0+G6yFcjbKZrYJdw==
X-Authority-Analysis: v=2.4 cv=PqcG/AM3 c=1 sm=1 tr=0 ts=6adef1bf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zDojY5Dqmkyknr1b:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nUn8ewCANHEy0S7HLBYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: qHGMQfX3ooJuAeR7AHo1Y4IzyUHzfFd_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNSBTYWx0ZWRfX1iIw+XGMWvjV
 Us2bsDgYxF8AWmFLaVAlXAQYNTuI5+20HDyxpiqAdRlzmywOABVKW5kdCIyLmuk5g6GTEG3gGDM
 QjqhzicCWWrcdwu25I2k/uPkgEqv4mI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_232256_699419_D84C0AB7 
X-CRM114-Status: UNSURE (   8.26  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,T_SPF_TEMPERROR,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested-by: Daizhuang Bai <daizhuang.bai@oss.qualcomm.com>
Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00277-QCACOLSWPL_V1_TO_SILICONZ-1

I took the entire state of the QRTR directory as of after these changes,
on top of 6.18.44 kernel, and with some trivial changes to avoid conflicts.
Then I cherry-picked the ath11k/ath12k changes, which
had no conflicts.

Before these changes, Cologne WLAN QRTR NID could conflict with CDSP QRTR NID.
After applying this series, the conflict is gone and WLAN/CDSP QRTR services
work as expected.

