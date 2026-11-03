Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB83606A326
	for <ath12k@archiver.kernel.org>; Tue,  3 Nov 2026 05:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXKoS1lF;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k3aZpieE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d/rZuL3T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jZY5YnVRTBPVc174ls57YUx9K1Cuc0oktWC0Xo/THb8=; b=dXKoS1lFNmRnR+
	BNCIN4fbD6BuV1N6/ZwcgUNg82loyaHbDraAdKGYgPFqm4c9eaLqxXlN14AwIsGSAEeNK39uPQoG4
	oYq4bEoFqUp45dO2gNG3gNhz4lCg8VajZmgbYTI7z6mSc1AgpppD698rB2yxNYUfR88cj3nL4upfT
	VJ1qqR7ESopGAKrg+6KYYXE04M5VlqnUesBwbveCWtKl4Z/ZmH5+yXt6RfrmoqqCoWdQdGBB6pY/1
	yFRYg2CGWL4Fp7Us1HqpOPis8E4kUttnUYUNwYiFMJf0YncoARDDcz2VCeMuE06gXV0ec07puJ5O8
	rY0ycPdd74D/jcZ1QsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6wn-000000017tF-3Ir0;
	Tue, 03 Nov 2026 05:20:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO6wl-000000017sl-22kv
	for ath12k@lists.infradead.org;
	Tue, 03 Nov 2026 05:20:36 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31eMY21431338
	for <ath12k@lists.infradead.org>; Tue, 3 Nov 2026 05:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jZY5YnVRTBPVc174ls57YUx9K1Cuc0oktWC0Xo/THb8=; b=k3aZpieEHZfx+efe
	nEe6HofJczZnIPk0MrYiMvcp/yvfkBDTxgKx1ykTXUM5E8WJuMjiNltkT4r9lXb6
	3OHy3GGTsV2oXTIBN+BlXJQ8J1QKATGZnGOQPFajA0ZTYOCXF9AeJ+oOADk6AjvK
	9PBgSoqlIL+h/fqADDJb9VJuUPkUU6JA12kcwCVdwprtOftR4tQ7Kt/2+lNWKCgn
	/p/TIA3dZiJPUlKYu6gX8/Z7znqAbCVI+uDImLbMFbY7tDu2u4VhkPoanvbzYMBU
	pzyz0l1VG6LLAqaa6vL5BVRfZCtL4DB+9cu1o1703gEnPrxT8LRgb+KUeuGYVuCA
	0nQ1zg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0872205-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 05:20:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e9501034c4so61154625ad.0
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 21:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793683233; x=1794288033; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jZY5YnVRTBPVc174ls57YUx9K1Cuc0oktWC0Xo/THb8=;
        b=d/rZuL3Ta8iJZT7vc9b7WNxc0iTh11KiJPI3ftnxWg+nlwbxguoEx022Qxu2EDzMnO
         FAxKQq03qd1cR5flKT1PMu2ZIWhrd9tZ6uw/bQLWS9YpK6eni9wLwEHCLj4AcqAdf3R5
         +wdSjP7XN3XnmZKvSwPdvCqcU/mWcIFRqZx6hw4takMA724l8HEKrI99/4sQiNm6t7cB
         wwNE8I/hyTPCRhXzJkU+261Pj6Fi1s/LCWbWRA3IOYDBMI71ot6DCuAx1berb2lLe7XB
         Rpu20kbuh00PN/BrB9Y6CJpg4tNzro4fAb0ZzzXca5oQ22HNwcOt5BlzkD4lDzxhQTl8
         Ksnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793683233; x=1794288033;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZY5YnVRTBPVc174ls57YUx9K1Cuc0oktWC0Xo/THb8=;
        b=igMRIBgJ94jd4E6UWLt+JB0y5M5UjHvrc5KKqA5dOQ3izCuE0s/adC+MBTaGX8Zd8Z
         b6r6v1gf6X/Bik51yohpH5c6CSny+McPCJFFsI++2Sh6yiS/PGk8ijZxL3cGnDSsp8Vz
         kTDt8brYnRATpt7AlN75i83ah84qavsmcnViGGANG4LdypjXVDJMboWDL+9ksce8Qe9I
         XiHpzbRmyIayWgUPaaNemwgqW6LZRWZYz+4lRDWgYoE6YbKM3D//chadGYnZe+leyHvp
         J/Td/n0IhB37JUnG2xa1mR2y8NdyQKc/bbdoFzHVLc6kt2bJmLHnt4xLoBW3+3e3SNER
         LIJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzy4CnPAQKGR0pcXgVaDqs2C9LKdjgEbE7BsT8SHWHG5GMk/1M0y9qsfpFZpXZiXOUOF1tDF0c=@lists.infradead.org
X-Gm-Message-State: APuU4Z9/GmLjhPIkXg0NogLvgFxBjbc0mHCVKgpDk6iOaFbsVktt7NXI
	j794e/cn5REwKp4paROBkltue1z4/dAJLD8aQ8mHOD8sh/PgtVJUmzWURS2F+A1AHE9NOhWMDV0
	NuD68nj59HBN1oLwem9WPxvZ/JI8LmtrfypMKgG21Dw6BWrkwyXt9kBW12KpjWNchzWoHkj3FKY
	w=
X-Gm-Gg: AYBFou1JX0Tf/CAddYmIQGPVohriwVr22RWmFUQjTwQQ8NbeCmrt3swB55bSNf6loH1
	Fzh/IS/9s1sJV9fO3J+CrqS+eF1ROpoYVdhlVXZvsEm4rlaE/pA0wDHly7wA6mZ1um+vfYdnR5y
	kKn+I7EOQE/oWfNrcGxi9GZGTmrEwqmLkHMrVNNzWAnvWmzLebDSXW2M2PS8GRrLwhmOUTn4yZq
	9hakBA5U/j22h/z3hJIMsRt1zeQ4ZpBvc470/w/iIHvRBSy+LihBzJYEs5CCDelxNkAOcxkBuYd
	G2xA8bNgdN+r8bV7pKZQNMcWJKIcYljpz2uvzebhBVVLUMIobn/LJIgpsBqr6iO3PMvs5vgC8IA
	utSaaYxRbryZ2fS2L4cJOpt7lM9jjBanD31eJAL3T4qwSnpbzGi7IKjH/S6YIegfC+9MfuiFB55
	EBSRzCXd55p2v5vYc2PjOz/KEJeShDx+l0z6FEaLbkpAI=
X-Received: by 2002:a17:902:dac9:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2eb364f0f6cmr137697865ad.45.1793683233334;
        Mon, 02 Nov 2026 21:20:33 -0800 (PST)
X-Received: by 2002:a17:902:dac9:b0:2e9:502a:ddbb with SMTP id d9443c01a7336-2eb364f0f6cmr137697675ad.45.1793683232907;
        Mon, 02 Nov 2026 21:20:32 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm35838775ad.73.2026.11.02.21.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 21:20:32 -0800 (PST)
Message-ID: <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 13:20:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXyu1fwFCu9pvN
 uMXKfhi+vQ/ZayT1g6FDuMNQ8vh0C7kxFUjq3C99DnPfw3erAWOvdTq7JP2Z8F1ZLq/LuQIdtX0
 2Jmsf8mQbbvYs5qIO1pA8JmpRoJ3aOA=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae96f22 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=C9cPvLXlrCZ_zlmpmt8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAyMSBTYWx0ZWRfXycEgkFUMgB9g
 zEZWsbkPwCQEGWUf8hG/KEGWX/jRcxD8+or3G5yhiSTdTEfGEdXCSEo13kfeg5XMv5miAZ6fISI
 kryUtIMolkqCaldx+u/F18CeavPBwaqqS+N81bux/x+JUFtY5clloADW6jssMivKY6Tp0vTl5/q
 XOQULfolc/PMAwVKGisy0XVQYPkCUP0V/jm9D+n8C523nU6j0/E+mxMELbr3fa2vKt4bT+dLoiD
 e/Sl6BVi5O3Akq1RBuinDm+iRCyyY4RPF30DlMfPGHvm70CGZZYLK7olKzepsjOt8vo97iUD7su
 Crn01mM4s8IPIJkTOTlA63UoTmIjh+yLuLgS6zsUwmvWyG4mBY82xbLoO37FqgXb+mplzil14YA
 V1IRrSWxu0kNbOXGFIPgdHgSQrAzfnWBsuVOSvdG/Zf1g0szYXtIeZyhhlVbreYNLXKgVp5dMi0
 s4uz0JD4s3xzIAj1pww==
X-Proofpoint-ORIG-GUID: J4ziGF1FsrrD4KGZ8douPLRN7-7bCw6I
X-Proofpoint-GUID: J4ziGF1FsrrD4KGZ8douPLRN7-7bCw6I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_212035_647292_8044195B 
X-CRM114-Status: UNSURE (   6.32  )
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


Hmm, forget to reset revision number ...

Jeff, let me know if I need to resend it with number fixed.

