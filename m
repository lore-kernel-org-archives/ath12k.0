Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3933C54756
	for <ath12k@archiver.kernel.org>; Mon, 19 May 2025 18:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lu9IvRz0vgh0VPf2mVMC3ARfT8ah5nL2M6eYMOzKR9U=; b=hdgCwawIs/LmaL1voC8lXdDRTu
	CmRV+LUlcug3hMzgXoiFYfRWVwEz3HFQW3h3QlzCdAVc+sOkr+SRHge9bBhxnACAX8ZlNTLQ5mj03
	HuhVHZdrCpIPIn6ypEDiqrQ6IZPlUHlYidu2RdbJrH1TDONrJFTabw6YYa3bEhaTIS0aWmPElOehM
	ZGyw/sL/3xxWH17cpE3CYceKBdGILEPrdfZYj+rys5XkxH/QkFWbrOjReSVK4Pf1PHSSaBPKZSMDB
	R3vne0nVZqo6eXdVAk4GqyTEwKrFSLJBf4Eblo+4mthYLZ5MdYoYQvFs2MdLvv+0pizF0of0isy4o
	Td78D/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56a-0000000A7iX-1olu;
	Mon, 19 May 2025 18:20:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4av-0000000A0uz-3sCb
	for ath12k@lists.infradead.org;
	Mon, 19 May 2025 17:48:11 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8pIg4027166
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lu9IvRz0vgh0VPf2mVMC3ARfT8ah5nL2M6eYMOzKR9U=; b=KtHHa4CRzSgltpAb
	dIOh1BPsaoJ6GB6U4kgkVjdrQFCDSLSxXPAPayXQ9sR+ykW8Gp41NEee7UW+zXYL
	YsnRwPjWa68ur3xQN7fWabYJQ5ahCqcqSQJ4TtRPJeO8R+1HgT47T2pWodjpv1Uv
	DysDaG4dmlGyZ5iAYQ3/2302p0x7jgraIuZAD5EaiEu9YHKUMmobAz9Zznj9eNmQ
	EplUqnVSHS2ibnwJ3i4WgfvD2W/045MqL+DEs34GBwWtP5gndRevHxxJO5q7DQk/
	/8RPjkiacYt93XUu6jYtLj9E/YUfjCmzIfnZid6sIEkn1FCuecmU/jdelyEyLQMk
	aPhQAQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9w671-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 May 2025 17:48:09 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e0fee53eso2648247a12.1
        for <ath12k@lists.infradead.org>; Mon, 19 May 2025 10:48:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676889; x=1748281689;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lu9IvRz0vgh0VPf2mVMC3ARfT8ah5nL2M6eYMOzKR9U=;
        b=bc5fUFpszrPjZVrinQjQl0sVK4lunMXKHA3338IsfbPKe3mZwRNo1/21jrWJBsI3aW
         aRdjVHRg1Ee2cHNrhXCGbyGJ9V0ZKj4dMZWF8t9xQ/Tauh/brrTgIO1h7bYJR0/+ssF4
         OeHIKK30YN4IAmBfs3Q3M/wGjiExhnyOJb3cZQ2MBrAShIuHCTz/UxkyYpRaukdbrz+J
         Tj89a6kjJgyk93ycBHsB6sHoSs5iWUw9yh7jn5emK3d5lmdQ5ziPORnt/32x+qdC1V2E
         HQQAiAOF3WHf5se0qCsZLaZ8O8mJIjFxNQtBmlbpwUMNqo/dRMjqyvtJl5U0tyZJrLS4
         FSXQ==
X-Gm-Message-State: AOJu0Yyd9cN4mK/DoR4dyg8ytzKRhxtH7qnEN7tN/jAhc5R+DDL2riU0
	oUJ5lJD1ajFtTAVnL2zdrENx3gEMcZswrWAL/b790EhFeRiiphxb42fk9PEggxDqgQ9LQoXG/Gu
	9pv3uXJKXqFZJoQRCPXFj6UOFIQWZCuFug+JKdTSdkeZkX8I/gTnH8b20xE+eyfAW
X-Gm-Gg: ASbGncsXwJyi282/E2xRjaBYSscbx4BvVzaL8lWp9XRd7Q4O5mcJYPKiPMcPCYhRxwl
	T7aHgHp41RZz470IeqlacMUDAHyiMHzV14FlNdA4zyNssbLZwdJv7apq8NUoFqgSxbA4SaGaaMw
	TkmeTXIT2pmgBx4JYopur9jZ3ijztcIepyXJxyaTrqNFBs65oD7+axXHfH+QZOBvtWYLpcGQVtL
	N429PycdeJov6zmmEuweVWgLXsXhSQBhdP0GOi44zkUIlXr6cpnvFAlsaYol+QacakWQWz+WX+y
	HJ9SIeK/xLzFlYlpLPowdxk+YdrSumogw2u6cHiJFpfXd91r
X-Received: by 2002:a17:902:f648:b0:224:f12:3735 with SMTP id d9443c01a7336-231de34468fmr203642985ad.31.1747676888742;
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWucOxXROLeNBzWIWs0QhMZ/i9p54oWNrg+8F7yqrejxyn/eAwE0eL0qCwSOlf9U/ucIR5/Q==
X-Received: by 2002:a17:902:f648:b0:224:f12:3735 with SMTP id d9443c01a7336-231de34468fmr203642695ad.31.1747676888342;
        Mon, 19 May 2025 10:48:08 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4afe8b0sm62651425ad.89.2025.05.19.10.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 10:48:07 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Miaoqing Pan <quic_miaoqing@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
References: <20250424005703.2479907-1-quic_miaoqing@quicinc.com>
Subject: Re: [RESEND ath-next 0/2] wifi: ath12k: support usercase-specific
 firmware overrides
Message-Id: <174767688738.2567051.17814529820458546404.b4-ty@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:48:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: pIglgSmZWjU5J5AYpxmTQzPk-2y8Z9-v
X-Proofpoint-ORIG-GUID: pIglgSmZWjU5J5AYpxmTQzPk-2y8Z9-v
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b6ed9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=ZHLDmf7C8hvfDcYlofMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE2NSBTYWx0ZWRfXw/c7LU40veiF
 k5IqiUfmMEji8NlbdEmFwhYWxpJvGZv79fx2OMc1K8yUvPhCT1MpxQmNjVfUAvHS19zOvuTG5xR
 GQ6aAOcORR65LHPOySV1+TLaNRwlAONtoEGyr1bQIyFmbtQDY4sx77gCzRkJ88rJpjJjIruRN11
 XyqlkNsWmUxBafo+BhrlXYaidDE0CVKnJf2Djgyf3de8ohpBCa8xJqW6jOctKkuJPoC4gNEItc7
 dj3R0pmJQWsWQWwtBnrCwCUCMFPacFxza0aSa3si+Z1QXH6R80JzCtua1y8fH+bErMBPNZdA2S3
 85sTGNL9Faj2z/x2N2ilYTUzrWlFwU+JU+zHso6bV5IRCT9B9tKEa03RmyH9FhprrUriCqDveiQ
 V2nOco3ljU/k8RXJyntCsRboesduHIjEbyXyAkba05D2gBUE71CBSxNQVhRmmeLyEsUMu/Tz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_07,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=949 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104809_978361_493591DD 
X-CRM114-Status: UNSURE (   8.02  )
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


On Thu, 24 Apr 2025 08:57:01 +0800, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators to
> decide which usecase-specific firmware to run on the WCN7850 platform.
> 
> Miaoqing Pan (2):
>   dt-bindings: net: wireless: ath12k: describe firmware-name property
>   wifi: ath12k: support usercase-specific firmware overrides
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: net: wireless: ath12k: describe firmware-name property
      commit: 607d6e49dae5336bd9f7356b0e227d8571450bd1
[2/2] wifi: ath12k: support usercase-specific firmware overrides
      commit: a9610bc482ef9c77ee0f3b7c077e0b49732769b8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


