Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D4B3C44524
	for <ath12k@archiver.kernel.org>; Fri, 17 Jul 2026 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=; b=bsFMgdkZsITRLMGMn9xCXBX1TP
	jvFi+MYMZ9w5tPFb6l295vJM1E7/NIqvfw9QrAe47CHB9B5WMIkbUlKS09TbS1VJ7uakgx48bhOP2
	21O7I0ycR8jW2c6XVuf09AP/hHX5T3W0ZGqs/x73WGAUCejdYFQNM3wYTngO4BCYVsLauz7M5UKAv
	9qhQAelX8/VZTULEWdkTUAlJh4TBJJSPhxqgk8JoyWTQSc1kna13jeazbeq2eqJrs804b2xDsA6sb
	U5r6LX0CbJ7dDOAci77P2eOGR/KvJVD7xbA5IZRuL5isQH6Sa0lsJMLJ4vi0bSZ1IquQS08JGGzDM
	zBzCfjAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8j-00000002YVe-3KcZ;
	Fri, 17 Jul 2026 15:06:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkk8h-00000002YTH-1fk4
	for ath12k@lists.infradead.org;
	Fri, 17 Jul 2026 15:06:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7h1F2093819
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=; b=nA3Hz/z8glHnVomw
	/n2fAZX85ZjXPngXvYzPTv4qtmvLPj5Tr7Dtr7Mh/J5HqOQacM/ZxWHS6Z6TeC+5
	Hp4bXR6Fmx/+YJupAAIxFmSKOaKm5KIDDIObD7aZ2ojuULLsg4QocGZrniM5uRCb
	vy5XpmBjXxzujYOqV3tm1AqG39J7IAHMAx/iMgEPgmxdGD4OieKKIKACwYsCvwdw
	Kg69ELGMmKqC1XLImEMLHqEgLJGjoES7Itf7sX9Tm7nQGnkm5uhMbml6C4S75axN
	CPXcmpNl0wzFw4imPUP5TXTf9XR2KBxO2rnVssUfqvosM4GtlJpLmsHxRUfmg4qT
	UWXPwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffbqujptj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 15:06:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1504243a91.1
        for <ath12k@lists.infradead.org>; Fri, 17 Jul 2026 08:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784300770; x=1784905570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=;
        b=VUA5U8IvVhH3E0HaJCQo5uifGZjFoFIJoLgUkmRlW4rW4lxmNQd9DjhPZkdlas7WTM
         gpRAiAnX+ebEGDk4D+3I374HVuasuM82m6b7KD+/KkE6RUb855fnRmnuHlmEayfImYWy
         mETXRmNQdCLON6Vbftj1UXKC+QXjW5LUknJqAQtGo45rapwLipavNsC372U73ATzI7DX
         cJnrOjLH3m45s00x2KHxzwLiBBqmybUI8dTJxO0+vmSWnA4+wo/J/QMjDg28uCM0aCoK
         OKvZgLMxnj2d0C/x8+il7tAmQuyq9g/P4j1ugqvKd/aPPvac7ohuO0IOB1xL0RisZy5U
         ljQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300770; x=1784905570;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4p3TEGAo50xViMa0mLxtrvMyupxCIU52JinKAJuBPQ=;
        b=brnCKVBa5y76Ms04bGAGLw552rYd/ZZY5NcKHOutvWV9KJEMKCtO1Oe1TAV0eyJtTs
         Gs6fAp0Yd3JrggkxY1PsUBdsgamzzP0JwXfAu0ozV+hd0N87vhOIiRfDd/MC70X5BV29
         lPn+nT5OoorjNYe+u64mE7CtN4jqeBfvLj30lJESBv43LRiLx2+h33FlAb8hhnri82wO
         0JNieBNqLOoVsnq1rr97x1DplC0Hh8yIE0lbRSVBoP4C4Dnlh31eEw2Z+tEBj0hmoc2M
         IDTTCRZA8Ck0iMlID8t3SbOD79oApAl/1e0VhhdulMDS56p9Nh5I9nICw1N/svMTTNp0
         bzHA==
X-Forwarded-Encrypted: i=1; AHgh+RoSciZcMIsThda7jkOT1MsXjFVyGkySS2OYQNLuntXyC6jd1nQGWq0OvdkR3i5bnqoBGKhFTKg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5ThcDvCBgfGTNWiDPZnoR131+Yapm97HIjD2UTDSgYrg143L9
	poCushAELOYy7Trzc0vEgC68SNlLof/pnlyR7UY8wTuyyFmtRUFoQvT5ECR0xqI1+Hwn1SXK4kT
	HNsUWa2tQYCci/TQbZ9/1MMTRZyg61I57iAZsJYjFHmSJto097qK44MaglbWLxUNp
X-Gm-Gg: AfdE7cnXtVgye2zyDQputG0PAhQ6hga893usTUZ8eANaB0FNEt3DBmNBQ1H47sBlodK
	7+trGpyVfImnnh8jUNbCtJihV/JPs2AwoxmcWeajykzKvcmnfTD9xedB4wxwVXey2UjCi6lpJhd
	xth8boT7PvYOlOa6aFYHwGF4QJe9HIv5HmWNlHxNQHA9Di9eCaM6sLNtLHpj71hLPQ+Zwqvuk+v
	ly4trqUO7BCv+MaDBKyrR49Pj556KvPjsSH6YjCAy9kVMy6PiB9FT2FQIkuh8S5P+nigHVkJx0b
	CXDYOPff2NuBw05PYVzVO4IQbAsfFBJUC2pSpEjrV4mE6nvpqwnBsUyHRYUf/nihnnrrUKn3yyK
	AiO9cKlH5Zaj9q4Z2MV0KhTZRWRISzaAsp8CcWx3YXZAldU70SRkARfQ=
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr7255016a91.13.1784300770085;
        Fri, 17 Jul 2026 08:06:10 -0700 (PDT)
X-Received: by 2002:a17:90a:da86:b0:36b:4d63:4a93 with SMTP id 98e67ed59e1d1-38e3d21fc15mr7254971a91.13.1784300769630;
        Fri, 17 Jul 2026 08:06:09 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1dde81sm15681190eec.21.2026.07.17.08.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:06:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
Message-Id: <178430076786.128359.10643101937455909473.b4-ty@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 08:06:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: LKCuJpoibVXWRG7ROmw4JfqRD1EBq7s1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfXy7UxWumffHTC
 cYPjDcQid70wvvnOetiX7jCNb3IzNpI+OksVGXpNAFEQVlve79zmM4frM/jaMMmx9mUT6Gs6DnW
 o5cVyNRLFq21IJDJglSKzpfezbkS2o7K+ku0eSR+MvqYFyJCRFH5N6iKkVx1KY4uQYq98ASYhMV
 cA7usC0FHIxWcJ6xGzoRXih0qbxPqTXODhS2fjOomC3l2Jc35uxKulEzvdiVfCczYW/di3EQeNz
 7rVnE6Bgk71MmYNF5cjPC/EJRI4+0appNEW+osHAgioeWoyzrHTVgDSJ/lnQQigyB4btF7l6Zvr
 soa/392Zb0ESheyFNlhVZCNkvEcrOSCbRpWozsRuUko1/xkKDemggo85WBOlCOIQPvWIWn5BRcL
 XwYrMPkS4FXo5MOV/TG2XWghKrOyB6UCA7d0Av7HzfWIwe59lcFx2nZPbonRyCFa5TeB7fyvYU+
 VyxrAPPbdC0b5jiVfRw==
X-Authority-Analysis: v=2.4 cv=NZ3WEWD4 c=1 sm=1 tr=0 ts=6a5a44e3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: LKCuJpoibVXWRG7ROmw4JfqRD1EBq7s1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE1NCBTYWx0ZWRfX3v/A50tXBxeb
 mrLSa5CoYTQsyqESIu9gskr/UNtiggMBKcLzPWvbcUHldi+njoSDR1Kw+jMx6/k9FGTcvksDkBm
 wc1yCBwvJ1fNhjHkbs16OujvygVUw+w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_080611_457529_D5AB00B1 
X-CRM114-Status: GOOD (  10.73  )
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


On Tue, 14 Jul 2026 10:39:14 +0200, Christophe JAILLET wrote:
> 'struct ath12k_dp_arch_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    6318	   3384	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Constify struct ath12k_dp_arch_ops
      commit: ca435fd0650ac512ab6c5bdfeb90ed130b8f7574

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


