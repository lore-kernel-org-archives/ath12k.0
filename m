Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BD6606A886
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 22:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BuMPlj3f;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GmxTcNTr;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iGlJW6w6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OH+IeXBuEkr0lbOKcqCK4KBr0HpQVHiWCgpCWBYfrZ4=; b=BuMPlj3feXOmpH
	bvRIrLZvykNeyecFKjNb+aBDnlq9iTUr8d7k1be0BNEbjt4qU4CO0qoItbwa/Rxy/NpGHqYjk1BfM
	H2npHoJArLRg+pqT5DTh2Kek1nMj48n9qOv/04u/iTwC/ZdnKu/tTJ5dAjgBhHY3cuZqjFcO0edfG
	ylwLmc9vx2I6pADxTb228BYWq5/R1k7QcnNPBeisp0vsuHlEklqJ/N46ePIQwA0NV3dkTVaAdeTxA
	dwnfoyG8Jz3NSZjUKMcy2z6d6DxwmQJpmjZiC1k1TgRaLmmDZOf3m0Y9662wBlyG9m5B7Hw0/Zw66
	uWwpzHp7B2wxHqAxJI9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L9-000000044Au-3jjg;
	Mon, 16 Nov 2026 22:38:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT5L7-0000000449s-1CH6
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 22:38:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGJfmQ74147195
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OH+IeXBuEkr0lbOKcqCK4KBr0HpQVHiWCgpCWBYfrZ4=; b=GmxTcNTrSqwn81qe
	Y6dLDQQIgkIX7lRZbhtc3irmaH4Wfs1brVJpp021h80CGlJByqkvGJUwxDi79Aux
	f4UtxwuwACo82ZyntC/Ry3HKgJxxLLLIWEsp0B4Cf22txoGYxy/efd7EpVPYLen2
	cVm3ni3gK76NPCRuliGSRFNZW/wF3y7Em1ZDIBArwG73ZNl+8vTxK2uyQ9i2FkCQ
	d4ozHQvB/sStOrpjrua5yWgxwCigdJg0xz7Vpd7mpS6sIf2ixCXlWQ4EhzYHFkOm
	A1KoBpYVGLBGwXCBXjEO82KIJrerbndduf8dXJ79DpjZmHAOwzdzL4w9juC/Ad2k
	G7YeBw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f82bu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 22:38:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5714668eec.1
        for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794868695; x=1795473495; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OH+IeXBuEkr0lbOKcqCK4KBr0HpQVHiWCgpCWBYfrZ4=;
        b=iGlJW6w6ut0ODDIMahFJOPUDLffAq0mxwWOIMGNuztr2XELjM/8D/UXiceWlGpkzEd
         hPE1EO7IuCu8h4F29p4TI2iIzwUCTXjIy8aBrBhOX5qXcz8aEMarXU2eEnuivB7hI3aa
         EEeVIPduhSqffF0M8Q3zwqkWrLBVbLtaDnPVmNdnkzBjeFXp2lZAhNUwknKLGinOFbOS
         2thg3qi0bBNA3WY4XC4vpTomg+bYow4AlBMleNiQz4R24SqN1HifppI+yZt5Mk1iYnw5
         TBi9fGDLwc1Bm4RTN+6T2QxfHTwGMLSKMiFiJKSGkKbEq8ueQOcW7WYl6xn3xgqWdmBj
         eXYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794868695; x=1795473495;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OH+IeXBuEkr0lbOKcqCK4KBr0HpQVHiWCgpCWBYfrZ4=;
        b=MVekjDuRAI16SqmoGWMThp4sjErYDinGiWVSftdQT42N/+tAd/nXfuIKGMLx6gfy0l
         ALTaCEoIOAy7eNpOYk/gfyIhSISGRR4CdZsxmOwBZd4VvGFbDpaQFPFBDkfx3AOSsUrs
         8Q7bwH+zKyvFWk8PkuGdSVm4HeQZ0b2mhIDaQtsGRJebfYsKjbhQ4W8CSbJyDSrGrNyQ
         BcI1PCivrhYncRNkDfoaYpsaDlgqF+EVJq11UN9ZUwgMvKw8/Zq91tlFStVInr+oRRVy
         A+03jm8xus4sKUeBtuLcF/7Pw2x1MXOrLRfnbkT5mFz/pStnl2SVV77yaJvCizY4Fps3
         EwYQ==
X-Gm-Message-State: APuU4Z/SNOMwgPMOucdxcfkKmySjIN10VJG0YkCwQJf9WfTWgDrlmT+e
	tJ+p8cf67a272AEtejiLou8nCoVfYWc8+eDBekqeQbWwJoS0mv3LZ7xgUpIk6KU/l97dsCLSkqr
	8ytQyGJJiy54Bhgb5gJa1EXTvmU18TkQu9DuavZ2uqFGgamxVYiH+25rxdxiRKok2TC81i3nd
X-Gm-Gg: AZFdTZdY8RE4ATU2BQ1nMAtmFXRVvQq1YQnZYD7iI0+Wz7sqJd+BbmlHH6jlT6sPKOM
	GI0+yHjIAb9G3kdwGHcoorttRybY7zmm9ZTRUIWVu2HGE8dax8lrsANEdGCBCku7fPu9c3q3eEp
	pwB1G1unc7IoHx+sn5TKIXzvTZ0MwC77Pk+/k5FcU2ztsVlhXlAUS+LtXH0BuCdzASgaVMCzDam
	CWawFz/zoyCWNatfVyBw6AJTQjHDLVWXttNIxVJwwqai5Q5Rx1jIt6yIMprAaeR9J5rt4SHTGRR
	8JlmUzVJWhVb6lRC/yfk4HkrCOBtNOu3uWcSAYqxUdvoJb+jVW891Xt7qfAFJT7zZeAHr+zeMIm
	jQRolmG8q0OZMteSwBEdlGLzzc460gXNGa10EfYbU9pPxP/Cf3CR5Z63pPBrUa2URh6gd+E6ras
	vmJAeZxj1Rq5N/j6WzL2yQ+FR6y6c=
X-Received: by 2002:a05:693c:88dc:20b0:37a:7e8a:7407 with SMTP id 5a478bee46e88-37a7e8a74f4mr9224154eec.24.1794868695082;
        Mon, 16 Nov 2026 14:38:15 -0800 (PST)
X-Received: by 2002:a05:693c:88dc:20b0:37a:7e8a:7407 with SMTP id 5a478bee46e88-37a7e8a74f4mr9224126eec.24.1794868694407;
        Mon, 16 Nov 2026 14:38:14 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332ae7sm56671938eec.8.2026.11.16.14.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 14:38:13 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>
In-Reply-To: <20261116090707.3989756-1-karthikeyan.periyasamy@oss.qualcomm.com>
References: <20261116090707.3989756-1-karthikeyan.periyasamy@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Karthikeyan Periyasamy
Message-Id: <179486869361.378600.3216590833891520254.b4-ty@b4>
Date: Mon, 16 Nov 2026 14:38:13 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX5uUIl6CZg9x2
 6i9ZwfuptbIj4gfBUpQNPI7j37eZ7NFJYwJe3gshoHDbzUevKAxf5VXn3mHBy9O4VVzXxDe+io2
 aSBPGooXqwduFtZFro0JvuJ9pN0SOI+rmG2EPlspS9eXlbCwDxoDw9NZI0l+gKkmoIvn0RyYjqY
 BhTxvEwZGXWkxYd+Mfjk+tsvU0F2LIwDf+4TB4ZN572QW2gIVqobs8emc4nm8Qyx/bHDyODkAuA
 OMuZ2NSbWZHU+yxqwLnIqStDAuCvV3X6mEyTVsjNm//Fqx3p+tXydNxbZ74GCdtkIoClsBCLYjj
 wxQLmEd9URmuQY/PiZWxiu5SGBaCn1GNfY/aW/8oKR1stkkm51+j6kYjPIwFNrDerFKfPciUrH0
 dZ0EdL1iLwhGLsmqfcm464IpNq4YaWccchb6e3q3tLAllyveMga6D+CegYf97nGIpYoNJ1iNoS0
 W+Z8kC0Fg8abKvoZUSQ==
X-Proofpoint-GUID: wYl6lq-oOO4FgG3TIRT5YXPTov3ajQk9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA5MCBTYWx0ZWRfX6nxAw+2GTXIu
 qSH7g5wy4a6gevxsEKMs4TuToXAxDf7QznIhRn/DzQkzuX2CU08VzdAFPJ9iZbXTTfTzUbGuZZy
 UBl0GV7L6IORCQM5jJ8rkH4LgD4FRVU=
X-Proofpoint-ORIG-GUID: wYl6lq-oOO4FgG3TIRT5YXPTov3ajQk9
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb85d8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=suNcjr81Ih8afQCtYCQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_143817_444143_D0A8FD77 
X-CRM114-Status: UNSURE (   6.47  )
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


On Mon, 16 Nov 2026 14:37:07 +0530, Karthikeyan Periyasamy wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Karthikeyan Periyasamy
      commit: 93e1a48e9a6fc95b107952682b890c223021d040

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


