Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD841C44507
	for <ath12k@archiver.kernel.org>; Wed, 15 Jul 2026 02:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=; b=EhNMDC7Fh3sCJ/DwBQo1y5NU/8
	iStqe/pWSKhCiPl5phfZ7+SzpC3Iq42NYzZjMgoqa7H9Mnrmj+caxy1F5xHD6f8dKPaqiJDoE1t96
	rm3u0tJBFJlWrWOgRykZnD11/J185idqFfE0n4WIhOc8tivGb/jJGAcr5A8Di9tgmN01pA7bAFfQ4
	h4irFJtqPc05F57B315ncPU5/4ueKVbyqpLXICytXdLXUodPfAv1RcvXh65mh2OnL2lMNa6v3kLas
	bDBXyr5Gy8eGuCMxGyxkEzX81In7d/zfQVCSYC9J4acBlfPH5gqZZS59bSd7I/54jXBVYbBmkKkby
	JQIHcTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoyT-0000000Db5R-0alX;
	Wed, 15 Jul 2026 02:03:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoyP-0000000Db54-4A2E
	for ath12k@lists.infradead.org;
	Wed, 15 Jul 2026 02:03:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F0I9xQ2134876
	for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 02:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=; b=FL0BpXOHuXsC5spq
	8iRCBZXopVQXW2LLhZtikxlZ+ZZoY5v41pgoW/hIFaf/hQV0zYLFg53I1sSlV6pa
	clr5gVO72MuPt20IQ0P95QVcLOCOMDHGjoJsQnLGST0iiNMc7YTp5FP430QWYaaM
	jAlRfO2ha6ZOPU8ClVffI4Hngpif+onM12PAAxJYUzGGHjF/ZAe27ZN4ihb/nqzT
	OhZ3cmsQssIhALu/kptc2P3xs12pCc5XcuyB6IjvoiGQ3gu3Ivkkbx1Cq6P1mXAE
	Xfs1LZV5oa+Nqqt48jVyadjyC2aHf0VSp7cMG6YNIKHKtjat5Q4vldTGiVQvcI6/
	jJ7jzA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fds9hsgey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 15 Jul 2026 02:03:45 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8423f1fe39eso2941631b3a.1
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 19:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784081025; x=1784685825; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=;
        b=PGAcG2ENnxxjANDhMDORQ6rZHMyi9N90Cp/5nKgqIjx6ZS94fChRvOhOULezJtMSAi
         IqhO9A2td1nfk5ONFKkqBVpgsHKa3RYxDOHySJrKbIVYQgPOla2t6QexBtH8GU5u6XyT
         swhkBNF5lGonJPaPEl4SKDBgaJlrrQXiCgm7i9vXeAya33uYy9uiJgTYt5+IQEJlF06K
         dNeg+7SqYNYhIsAX8msvnkyhAYPAPBbHnJkEPceXkUTzXZ2mGX6q0LqSg9+6aXuzg8N5
         Ahkln7fzk5XxbxU/uqBs0xuk1wHMyjnv98grRc4ZDkqqlF0Pb+V5+lUcpt7cFsSKH+MW
         OK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784081025; x=1784685825;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8fS1BDRuzXXVA2bJ29egzRQIfylg5yjs+J7PoBFZO4=;
        b=bQfDFifYsDx3vgJuzfxbYP7J78hmWzjFFronX2BGSpflklWXmVuZRi7tbHieTG5Hoc
         fFqKeEzJXtfLJpxUGY1qPmtd8vIP4ca4fg+HDdeHH+FiZzbbcxQ9OsYskfFTaEUXpgQw
         ECJjIKoKgzfZz3KHlmmRsYAofsMo4P0pM9lGjJ/DkEG+XfWyyWRraJHAhEl0vK2lsES/
         3kT9aHbTKCwADKSvoONrKXxTWOrSu5LXVnDzue+k0YwqFTQqTcmdfsBWGkJf15Y+9CmZ
         pp9i1yx8di6hmuKnU5nn7E76XpbgxBNygAC+2eLX9RRjXW8bSDnerayXWRAzAl03sUhC
         LvXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrQ4IQagZCdR5OO24+sWDLkunTz5ujy0h+kDBvzI32dPxpLqTJa9Sr9TbCVEUp0upeaxL3aLUk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcSdwHOM7cQU9Dl9iJvIJFGnTW0g2U5SWBpcWrqcM39jGSChAj
	najMkOgpmeo7rboUEJ37/eLpw8k8evbjb8vJMURVwTjoKOyHkpj/WSpJAG2V1+YHeDJzRkvwaZF
	d1BifhGfL9FhLoqVVDSWQRRRP+QWn9zWh5YFqD+jlcMNN01r5VBn3WdDxUGGnNojj
X-Gm-Gg: AfdE7cnbJRp+5TcQOCWqi0kaB1Ko7crS3rDFwlmdOkXwq3SPX2EnKvZAuIGl/CKBN1c
	A4VizZy7xrus+zEd+f8gZaPZVw1dQRHBLsJ8B7ZVMqWaSNArkC+PmsmrX6Wx8uUx5C5UBHwjNl7
	QUUm56Kn+JNGI6tB/QwxY9ZUNPq7ITgRqx/U3GCMv3Y457GDtmbmoRPf17H89sxlUzGOQcDr50f
	agp13ybA4phudZiMTtM2/Cu3opCZnWYgmlmXfcj/TcnNalzER4qvrDI1WQaqtgL/ekry1S1MBlj
	VueGX+7j7+V0H+DcXWX6DqKVmloDuyObTl4P42gVdqZQiX+ZU/r+dUQ8O0rLATh1Gt6fgRam6J7
	AKp+J0Y0e9/oS22gNFFxNsC7pngxm7UmPiFOVFMA6N9PrhPh3N6yg/6b1+4pA3ptlXwG8zpZvgF
	zFge/2NRU=
X-Received: by 2002:a05:6a00:22ce:b0:847:8f0d:cc09 with SMTP id d2e1a72fcca58-8488970ab05mr14510492b3a.44.1784081024580;
        Tue, 14 Jul 2026 19:03:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:22ce:b0:847:8f0d:cc09 with SMTP id d2e1a72fcca58-8488970ab05mr14510481b3a.44.1784081024190;
        Tue, 14 Jul 2026 19:03:44 -0700 (PDT)
Received: from [10.133.33.98] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a5f3sm2224727b3a.5.2026.07.14.19.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 19:03:43 -0700 (PDT)
Message-ID: <5dc0bcac-82bc-4ab3-9b56-f8b670c250e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 10:03:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: Constify struct ath12k_dp_arch_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <969d732e2c6f169e1aa5e89c7e01743a1adb55df.1784010931.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ib+3n2qa c=1 sm=1 tr=0 ts=6a56ea81 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=riUHQTvyFV0r_oIck2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: WdzjpkUsacUMJxKiF088IAp_e6LWEeBx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDAxNyBTYWx0ZWRfX7LaLpICM8E6a
 BkF5l1DYKi7IG4eXfJGHiPIPfjFc4JiWgzEeGa46rwCR2+zJqWecIcNb/Du+Lddpqk+JIkxtclj
 evl+bIxSx2xY/eqeCdMTzAD5AL0fREc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDAxNyBTYWx0ZWRfX6u1JsaXe1brP
 qiV0glQBSXjBIEYryZcpBiLUbRnxyalAdthpGpY7dixpmLexhZkFeV7zyR7rKGVCZccCdiCgsNF
 2ZwOgtyZJiy1KuTfvu5sqn9IbG/Y+/HrV9UQZicwRj1b2lcYm7Jqev+aAzM4ElWNUmfhe+Gamig
 Py8uogu6e4jsR6nx3uNISU8GF4cTPmjml1vPvVPdTcIxWMaoxzF/Wc51HP3zuh9IXNcJNwdDLqt
 zqqDV53/3ROrTULvV7lnobNJwo4jCdGsRfglQTsab5lM52lK5WyrllqL3U7Ip6QjrO5cejT073o
 kf22bGObm2q5ZQAlNr7YzvSEeHN6UXYiDMWdilA8adbfvdlxwBPVfMlDdgxVe4/65jlcaASMYO0
 L+AOLN7b1sVl2Ge+Msl/pD1eWeUTsFmA8bP3MC6mz6U1TO324ppZbc+zF37vcpZa03Iu3nmMI4K
 mlUdVgyfrr0bDHNFwvg==
X-Proofpoint-GUID: WdzjpkUsacUMJxKiF088IAp_e6LWEeBx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_01,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_190346_119517_8A9B12E8 
X-CRM114-Status: UNSURE (   9.94  )
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



On 7/14/2026 4:39 PM, Christophe JAILLET wrote:
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
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    6478	   3224	      0	   9702	   25e6	drivers/net/wireless/ath/ath12k/wifi7/dp.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

