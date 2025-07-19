Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F4EC83F34
	for <ath12k@archiver.kernel.org>; Sat, 19 Jul 2025 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZFp+JOKzx7DaEUo/HUAr/pzFRcL8dFxbeIn4tC71Fjk=; b=v7rR+kmLLXX70RmkIL2jcEYR/1
	T57gg4UmLFrt8OKHO5DqnfUQeoKma7DO/hEZLEpVwevFogoj1akr+onZLQHwgF/G9zlqdlwGyUEYq
	M4w21MjcdqywEkjIXpR4YwkBNW8wnjobYUchxNh+KQUVN7XmZHOIdd+QsHOO2IPEuX9+uVDjLvQcZ
	BxUhkomszgMh4MGR+hNloYES4zxxowGOUXFha0WmH7EqzPOU+KxLKOAlhqZfi7tCdkj3IvaRB+hUy
	KuZeYj3kGqGFqTpmLxi3mqKS51DPa5YKUyKM7efNRdjynlGD4rGZUEj/yJ1CkTx9v9PxXvxsZUL6g
	w75bFMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udAKk-0000000EQd1-1hoB;
	Sat, 19 Jul 2025 16:22:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udAKi-0000000EQcf-2FkZ
	for ath12k@lists.infradead.org;
	Sat, 19 Jul 2025 16:22:45 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J4DEJx007908
	for <ath12k@lists.infradead.org>; Sat, 19 Jul 2025 16:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFp+JOKzx7DaEUo/HUAr/pzFRcL8dFxbeIn4tC71Fjk=; b=WB/xOdeHB7O5H9DQ
	C46QbCfi5glmHgY6hysL23xcIey+CVJ6+/bkrWeHVL1QE/PT+GEwaHQh/jYpxrPI
	6VrM7KpuqlfTpw9eYkPLOVKqfs/FtAAKy0oE+MW1iniNqd0MdOjT0NyaJ0+m1SYo
	2TUcQ9+viyESGuNNWhg7WzW8/MvO+rOR92W+Pifnhp4wNfLyJN6vBMZlQxA1ZpxY
	kWcZz0X2CL0W4QGJAeJuzU7HrnYX8mnZa1voA9Mi0Z4vXlYEQz9eY3qO4KzK1k8K
	IBw7wXaXt9Z5cDNVUlPanISBppxXSKrqR4feGUq8fK0oHx792pP5R4jmjookAgkb
	hYPZlA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804518wd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 19 Jul 2025 16:22:40 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-75ab147e0a3so1332805b3a.3
        for <ath12k@lists.infradead.org>; Sat, 19 Jul 2025 09:22:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752942160; x=1753546960;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFp+JOKzx7DaEUo/HUAr/pzFRcL8dFxbeIn4tC71Fjk=;
        b=l/Krxk4zliPjjZCx9Uy25/G2z/if6M15y2uN89U/R475JzIBd/MAti+ifZ1IWsE0RR
         9pwGySNIsdgVQzKCDBevQzlmXxehpV7NIKUpMmZyyeqbcqce6RHkYXyFv2GflHX7nd/u
         asFz3Sc8rY8+JEPyI39ya5PBPDsA4y7lbTIvd+r3Nhiaut78nVqG6FUfCjxw3GAd/T7C
         OCsPe5waP6cGeX0pjU4kGnUIuvD7pvJlRng+H9dHn37/H+JBljetn7o+bsTJDQUyH/qB
         +PicSJ9QctjX9FCGBEOxi/W4GyXqb3ajmYGra9ynDBlSZCSXv1Ahk2sZ0WCKisXJl10J
         EY+A==
X-Gm-Message-State: AOJu0Yy2BR0cxdLOBqMp8XUkvSATorq9jxqrLmhUp6v1ff2F169fa5fR
	N35vPoX2A+Ydn8iau9D7IGaT3GFgIpdM20ind3ulQd4IJH9P0R9pd9NCdYlVsCd+Ccry8an55V6
	rTVGOfOCpxz/eyS1GhBxDlQQXgoWq6isoPN/q7ikaZToKg4AF29ZsiPo7jgWnn9Tr
X-Gm-Gg: ASbGncvwEplkx1E0+resSJt9KyhD//2ZrmVmvni9kFc6opPBn5RJaY/KjpQE8+e4krn
	uXwtnvClGfFgg7OPvCL+8+f6h40biH2s7FoYxaIThj6EofipC7cMLPCP1niK5BHhyMngg4zATLG
	sCR+JyiXEWosmk8a99m0cx5uuOHBLpRLKAcuzElSgSDKfTlHqir2Ni5SAQjnAOTqlf4zdZghcpt
	Et3DM4rt2KvbPRAvO2VwmgkQljj0AwHEaanvI9aT8T81lBDsafFP4sxuKgbMi2g3DWBHZ0IFRay
	iHXa6WSopdYy9WSDPysI5SVweHe5PBjNKGuxcM8zyJbAFPK2mtJVYItPz6cBpEvtLAbwQVlb8tK
	S
X-Received: by 2002:a05:6300:6b08:b0:238:3f64:41a4 with SMTP id adf61e73a8af0-2383f644810mr13205368637.44.1752942159693;
        Sat, 19 Jul 2025 09:22:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESNU7pu4aS0A61SLhunt6HW7PpyuYRHK3fH/Khb9c0IvkeDmiSLwCn9Shnkv9AN9sWgFQwsg==
X-Received: by 2002:a05:6300:6b08:b0:238:3f64:41a4 with SMTP id adf61e73a8af0-2383f644810mr13205350637.44.1752942159235;
        Sat, 19 Jul 2025 09:22:39 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc0bd12b5sm3488765a91.12.2025.07.19.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 09:22:38 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Nithyanantham Paramasivam <nithyanantham.paramasivam@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
References: <20250718025513.32982-1-nithyanantham.paramasivam@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/3] wifi: ath12k: Add 802.11 encap/decap
 offload support
Message-Id: <175294215850.1412292.8023789417274825666.b4-ty@oss.qualcomm.com>
Date: Sat, 19 Jul 2025 09:22:38 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687bc650 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=4XmXn8M6qWpED5Dd-1EA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: QaQGXQvDsrbeNvr_54hG20Hkf1pW_g4z
X-Proofpoint-GUID: QaQGXQvDsrbeNvr_54hG20Hkf1pW_g4z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDE2MyBTYWx0ZWRfX5oCLK7VkBvHL
 wy4yNQ4YYbOIcdEDqNc4XNcO5GdeTnJPwnE3aHqeX1jKOJXsombyDpojktQpaFYTgYu736WkE0P
 4I9M6fCvHI9rw2QeJSzvfkL10lMzeriufeG7Rfz8tXRcMLwJfQ/K3a2ELMTJITYmo2ENAZfy/UC
 /MzGuSKCb9ip7sxldZgyhB0BAfb/SMeNLpgMFVoGK7dxt18KyQZ/ix/vglNRd6V7/Tbyhbci3OX
 GA7zjd1dXi9mXbf4b41DyVdgflsudlMZq5qbfDaXQPhGMcKvJlNNCX02QDlovBapCnUjE/t5UCH
 vFBZyAgPBSviZM7HV887gXSjfB1t0n9mj7ETVyYQGjmmb72BeVkmTzfqSNVB+hNFjC7HL2EEFyO
 bTY+hBKm8dF+Cf+pE45O5w8wq061SNUTYJxgWLLcoH7IlT5KuJYx0DCBOuitMKnO41PvsU+U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=999 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507190163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_092244_705569_CED93771 
X-CRM114-Status: GOOD (  10.39  )
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


On Fri, 18 Jul 2025 08:25:10 +0530, Nithyanantham Paramasivam wrote:
> Currently, the mac80211 layer handles construction and parsing
> of 802.11 headers during packet transmission and reception.
> Offloading encapsulation and decapsulation to hardware can
> significantly enhance performance. This can be achieved by
> having the driver advertise hardware support to mac80211 to
> bypass 802.11 header processing
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Fix the handling of TX packets in Ethernet mode
      commit: 192c8e9a131f1772a635c3c5df4cb592bd7b3e8b
[2/3] wifi: ath12k: Fix TX status reporting to mac80211 when offload is enabled
      commit: 981050b918fc4c36e0ef3bd7392b39d7304ef09b
[3/3] wifi: ath12k: Advertise encapsulation/decapsulation offload support to mac80211
      commit: d29591d5b52eaa62bc8c07ec83fe63018b5546ea

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


