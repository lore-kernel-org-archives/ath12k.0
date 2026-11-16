Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D35606A323
	for <ath12k@archiver.kernel.org>; Mon, 16 Nov 2026 05:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xUKXYHoD;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BSLU8rb4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gsINO0CT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=; b=xUKXYHoD7NH5PN
	meSEHfLJib4FxOxHuZhAP3vyppa7xDHoUiNtRfugVHGDZxVjxuGXLxYrDwonmGnx9mAa4xQwSr6vM
	ShBE+nl+vTUkSevHjYX/ndnihViK16y+GYhHNcPeA9t1QK4X2XW9gtEmevNi1/ubOUHNgzD98t6wl
	eGywdDAdKO7jde3XAXFN+81pIBdz/pF8Vw6gd74ub6iDOQVPqbr7VMXFXjE8UPV7074bPn43dZUlv
	gY71ATL2Misb6ixqa1IogVBjUb7XQheLxkUXBzkOMLTbJ6cA0qOW4Hqbg9GuMcTMhX12LuPWSck+Y
	jhvRZfm90WoGqvbUyRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpGr-00000001AnY-2KjT;
	Mon, 16 Nov 2026 05:28:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSpGo-00000001AnA-2SHA
	for ath12k@lists.infradead.org;
	Mon, 16 Nov 2026 05:28:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LJ452880354
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 05:28:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=; b=BSLU8rb40a4A7lS5
	RQf8+O5Y/kwCmbIeyiHLZt+C//WvYALuwK9dtsPvRjWn96hBA68JPTFVTNDxngif
	y/8PAb776tWK4CCfvf2uGJa8YhtmS+jcnPe0LIWP7IIloIpxoNTk0QZqRUhNuXlV
	qpRR7NVST18jVNC5a5ygwJmKYNmfYKGWgwEQYV982H948rQrO7LzOh/10vn3p0vS
	YPX3mMM+EKbUmuDwkm7RFlb/Pku92/pxmhN8jmJjdeKHPWJs16dmPzHJ38lRS22z
	a0aX22PNUv/Dcxa94PLMYN4JYYW7jKzO5IJt1yVxvTqd+dmccojD8nIcA4Qvs6v1
	2VTqdw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj44x42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Nov 2026 05:28:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae7faf4ff7so1123778a91.3
        for <ath12k@lists.infradead.org>; Sun, 15 Nov 2026 21:28:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806924; x=1795411724; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=;
        b=gsINO0CT7NSHt1Vl5rB6VvMtKgOYz30UiXyFw89OuE7bDrQ2xvKkEpIHGTCzoDsxW6
         +/fbBzoZ2Y9RnvD0X0HaGTORLV8zrGCT8FCixUI13guf9ieggAIj1/Qut1bdmgq3t8+C
         un3mgj0xWNYomJlprd6R/g9vRif2peTa4M3aeyLrJlvH/pqTocnCtStjofr1d71rW9yR
         nIC9eAefIsoSkUEPYHC5ow4PLdCMJkx4p1NAGCoX64xYOdDerIWus8X10VafbSDdLZGg
         rqJ7CHbQXUXYu97fzMDcg7RUqRF0oFKWsku3IV3BjfgmZ/AWtDuo3b2ZVI/KP3jQ69Nr
         dsNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806924; x=1795411724;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PqjuuwrfYnP7FeTwnXNeFgOXAyjDC65pIT9t+yh9ZFk=;
        b=QYEm2LdP6oce82gc2nyMQ9yMV+pMYNFBRrtu9lqX1iA+sVimf8JWLUxa3OB9/hgV2q
         MR7c6rasUwPORYRMeVe44w0HIBBZlctUgUJriajDsRLnI6tLCu6/OB5lX4abbCRiu6HM
         zBzxwYA/7aYc1ZDJHj4/UDI1YWO7C0FbidwUiEKHmp266CvruZ0GLuPHCItX8ZLVBtw0
         CtZQfeeO44VRj9CIFFJ+5+R9TX250gBsiYdXyTPN1VzQeGjK5ok7iXPAEe7upNs29K4K
         nNUonR2TiItSBAqvv2AZpV8J01qCH0KZUOHMvavNzKjc0UkBTHD2t29DPxf/4RMzN+B4
         LjGQ==
X-Forwarded-Encrypted: i=1; AL+hErHNjOQaed1qfoFU5G5zHjWbNfdYp8vuojIT8D4dDdG2yOQ6exZ/IjoqvgzTQ7XfI0zT68RR4k8=@lists.infradead.org
X-Gm-Message-State: APuU4Z/OJ882DiHSgQwfDvOybCgsqZ1CQ8awr9CUIYoDAEqpaX10gy0d
	8oJlnOLBjhpVtMSd06nvAtUYpNxLrHxIf7UPJJndq6R03DYZkilBlPVZ5d2p1LSTiuiuknDpxff
	+Rg77OG9Be17OWlBJpdSqYJPS8J2Bp9XH6N4s6Ln4IBPBfPiqcWQuJtMGT7rLRjIz
X-Gm-Gg: AYBFou1enQeETlO0gumz+2bAYFKVqsf+YKcHJapE3YNiVRO8EYmCPHJwPOgfQOBASFH
	u/QX5Nh0n5Oa1T7HKmEQVCN1NANNH9GuNL2sa2sBpF2T+NLq86uuvyVRInGb7lD7xqQJm4fa15F
	S18wJcGLV5onm30ajyfSLqvYhk+07wu1etlZMyufWzNEWggQa2rsI8PeXX7jWNFFn8pI1hkn9V3
	aLr7GTqPoto++7vHrM2jNtfDFV9AZMhWfzwNSKJThybAeScmjwolqGhbqdM0oZDrn8kcqObsR4k
	1J96TNcgsh5JpkrmRay23Mn21WpkF23d3XWu6QVxPYgEBtlnk6deiSalP3BOYm1o3S90KCC31xs
	3ArQZHN6tmtMyWQXp9QvfLHLpMR2ya3NdX5+lw3ZX57w13MGsD9icc1g1NnciBoysMZeyAZDgS2
	NeFLg6FgnMMI2Q1NERDVvNaM6QWyNi3npyM45dWPzVkP+s
X-Received: by 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr10218436a91.43.1794806924452;
        Sun, 15 Nov 2026 21:28:44 -0800 (PST)
X-Received: by 2002:a17:90b:4b88:b0:3ac:80de:44e8 with SMTP id 98e67ed59e1d1-3b1b0ccc955mr10218423a91.43.1794806923995;
        Sun, 15 Nov 2026 21:28:43 -0800 (PST)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm16673592a91.11.2026.11.15.21.28.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 21:28:43 -0800 (PST)
Message-ID: <d3970c1a-4bf8-4231-8a31-ebe8f1c44f25@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 13:28:40 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v4 00/11] wifi: ath12k: resolve RX link id via
 logical link id on WCN7850/QCC2072
To: Walt Holman <waltholman09@gmail.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261102-ath12k-logical-link-id-v4-0-f4c7807c299b@oss.qualcomm.com>
 <f154f553-6739-48c6-bddf-21f429b34bae@oss.qualcomm.com>
 <a715e044-848f-4adf-b497-de745169e6d2@oss.qualcomm.com>
 <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4a56db1c-f6ba-4468-92e2-0d5553222c4f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX8GZwPr34Yu0W
 JEuVT/2UMbswnXnuvgooGb18GWoMYeOGSaovtINbfhRfzfQUpShbAB70PJEsN7u608o6En4J0L1
 PXSNRHvxl/lXnG/hGNhgO8n2MXZzAYL8SsmAjkP5HixNde/rsBzrm61Rm58F/7vOPhdgvCsn38A
 YCthC0FmZ4vyEJyi77OcdbKPCQ3jgQWHD3LR+1YIcN52QdxNU7PoufWKSON+eOIo+jFP2YLjLtO
 dxaM96vb+V/S4Efw4NfpidWehvopqmeqhGjdr8YXjovcwUHUm/NVIuWIzBz+3LFGK3Qi5ZJNBcp
 e5reU1GbGKIbTPVqWAGXmDJhDB1UBRhSAFihvsSTjgb/VET1FLigf2clL+hFmWtsAnfIecHxSd1
 1V/9ZU1IGyQLz3ajfEqyxbeOS7ZauT+M1IdKb1AGnb4IQEeFPVFN3uYY94WHyKa28PIsYX3+uct
 1uNJ55f7haJ6njcM80w==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa948d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gk6_8DYrtsVGEpf7B5QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: MJVybDBNCzHl9ZAUnyvrrCh8NgtVwr3i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX9xc6gOtj/ihG
 h0gsHUiiWlqp9XccDKqFAfH5Lgb/nH0wnOCo8csJk7HsofrdwfSlwUXpdzfiI0i1LIeGYm7bzGa
 +YrGN8ShFaSB3D8mjLl3B+ZoAHCLfus=
X-Proofpoint-ORIG-GUID: MJVybDBNCzHl9ZAUnyvrrCh8NgtVwr3i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_212846_766586_4D581C60 
X-CRM114-Status: UNSURE (   9.92  )
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



On 11/15/2026 3:35 AM, Walt Holman wrote:
> On 11/3/26 09:26, Jeff Johnson wrote:
>> On 11/2/2026 9:20 PM, Baochen Qiang wrote:
>>>
>>> Hmm, forget to reset revision number ...
>>>
>>> Jeff, let me know if I need to resend it with number fixed.
>>
>> No, this is fine. Waiting for a R-B from the infrastructure team.
>>
>> /jeff
> 
> Has there been any progress on this getting merged? I need the patches to connect to my
> wifi on anything other than the 2.4Ghz band with 7.4-rc2.

the v5 version has got merged in ath.git already:

https://lore.kernel.org/ath12k/20261110-ath12k-logical-link-id-v5-0-26a3ed38db09@oss.qualcomm.com/


