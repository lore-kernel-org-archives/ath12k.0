Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21A4606A31A
	for <ath12k@archiver.kernel.org>; Fri, 30 Oct 2026 07:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HGMtth7j;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZerbPfE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cISLDPKi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L/bbJavlObQ7jDu0caKT3HK1qaIAEj88zWLFtN2ScFA=; b=HGMtth7jLKDaZK
	zblfzlGhAYCnlcrp7RFhn7bIoDGHgGPX3MAUaQiZDqRzFKLQ6nubPcONefzIXZQtg8CSPVb43I1TY
	Jx3krAO393XAHpT/WkZb2qqMyJHNwDx4fb3jnmSUhKZFGzLXpHDJf/nlZV/UQ1NLKFSqmitdVVP3q
	h5BrHuI6wVToh8MuyHo/3EajImQMrWHUrBDYfDYRggOZ/P/A8eZenEkMvLGhPkVFIclb48ApyVxiN
	pSPWwcmze8Q6U4q92+h97GZ6144/qMmCJZ+2bSInjaflgeNm+PErXKhsLddfzwvm4+t1zdnqEfonz
	iWBVQGaDL+vD2jmjIhcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhWW-0000000B3j8-1zM0;
	Fri, 30 Oct 2026 07:59:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMhWT-0000000B3ie-0JnD
	for ath12k@lists.infradead.org;
	Fri, 30 Oct 2026 07:59:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F8Gs2913262
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 07:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L/bbJavlObQ7jDu0caKT3HK1qaIAEj88zWLFtN2ScFA=; b=jZerbPfETMR/Ugz6
	fOhQebqBFWC3NoOF9GLWKg0P4yEkFgZcTXXXL385j6rTfjamCBko5ImPJ+sIxixa
	iX1mPx4gqbuTfVZdSolbBKYaqqsc8dUaLUu7Y2KP1PUFNik4ZO4+j/UVB4RQqFFz
	0b2WVTmYikH7w4Pjn4Vu9azuPR8FqLJD0zkJRUwU7h+qPXl0YnY/x7xC9HjNwbrQ
	S7uLKrrrEG3L5tyEByhuCnUb+nTZ6FHZkSpLzl/vi2EJKeKUePZyU2zUWAJOQDQP
	f4OSe3Nb9Ku1D+i79tq+bIcOYh53J0eF9XzxkyH98xYdAXhjCNIBLk2Y/H1hwefT
	WOeDuA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qsv6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 07:59:35 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ae73921fd1so430465a91.1
        for <ath12k@lists.infradead.org>; Fri, 30 Oct 2026 00:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793347174; x=1793951974; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/bbJavlObQ7jDu0caKT3HK1qaIAEj88zWLFtN2ScFA=;
        b=cISLDPKiBOKJkXbgN5r9s47po2V0q23mGGSvsmfL74LxRcw3X7fY39zAZpF2LgCEej
         zzPDkjEdaQn/1rT2kACwRpZfyJgSRPLY+Yd1OC0+X2WlwLai13io+zmVq4EDSB4DZS8M
         I/wQrQno4FTeToQQaZpuaY0aEGN+1C0nToWJZt+IZGArs5e9j3iKrTJmSSa3opzIZIOV
         Xj5oouF52ccIJnNIwxKBynZpMcIjLxrUzCr66fBYn9DyU6kMX5HJt1XP3/aGt7ldOVS+
         DoeQ8Lr3BSiKn6Rw9AuxrzXIJ0PIx7k3cWiT+7MpYwLiq0N/2zBjXoOlxgcOKX2dWvlz
         62SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793347174; x=1793951974;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/bbJavlObQ7jDu0caKT3HK1qaIAEj88zWLFtN2ScFA=;
        b=UnORojLCqEkRUeNkNXBc5CGQuG1Ijtfx/W08/YgIqr04H3am9KLXOP7egbzAZcan9I
         emTrKwTL7ICQcRV/F7zfNPwx/ZtSNFXPr+zzc7vxfOM6MsameeRH8uPPzmTVcNbw+4+K
         Qf6G4ZwJoH9wHc3ji39oce1NszzsbbWn2Tn2XlbMynPktEwM9omekY3f2GceaPrGVzwq
         bHDtHZ1mZiy2YRdzEOID2bwsBW2VPHpHEIlRa62BYBow2DX4jmB7x2F5bQqrlLJFEmid
         GFxhDbqyAGu7mUZAQ8S5kiW2e1o1vcoZjo4zgr9YkozztTZOTSi+C03fkCWpUoNiv7sz
         sdCA==
X-Forwarded-Encrypted: i=1; AKwUvBzuv6Pp/nDhe8TgUCJxZdQvXWGJou/uCeYZvWBtTLhw4AmRS64QcAhef8gT9yu9LWFsViUHpfw=@lists.infradead.org
X-Gm-Message-State: AFq9FYJEgDS5lUoudyVkaOuUqOs7dkVKUEiBNC81OwNCI+TtbN5JYYVg
	MH1yZhSCRzokKnDTSVPGcQ+6viu2FtPBVTigy0i8+OxUaDobToHNssblvFY1NSNBOBSLqmbQEkk
	X/brZGjw7Hcw4IWTJJwnnWkF31zNnmxufK/8wi9nNZPNSy7+vik+3oif/xN7bM0aR
X-Gm-Gg: AYBFou2pj+Q/9qSRVUNy6SkBiGkaH/IxECEvwl8SdD3QvzUAbktJBaFhmzx6TPhlOFz
	RpXWut2YnwSwShft9Dx/j1RerZi+RCykrJqhuCBAUwkJH4y+gUdJuETJ5RH/OuknDFQklbfUvDM
	gW62Ih/N/5+5XeKkrmY4+tPl0mqG1BucqHsXWMrgpH2hFOLpQcuV1aa3VOzN0JRRqFgTKhp+101
	cYk2dHNqJ/i/vx0nRwDh9K5eSmJz2DIC+ksaXKiMLPSMTuVX+gt7m0QMgWoVn6c+2qLOR/eTIC0
	LWtBF52cg1xd2EK1A58sQt06/thNqMm0Sm4LuZnklX+kcD8B1zpdr39XIz4MISLxmKkxo+p4xue
	RqaGxNNDqpvEBZuLLyxK7eRL34yszZJYDzEu8bDgrufr1fRLCBzDuZg+l1am1zwnXX5CdP/1Xwx
	dlYFeHnbDEfVQbVqQhYWm96fR1jGnc/ITXP1E/5QQAl7wo
X-Received: by 2002:a17:90b:4986:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae89849d1amr1192456a91.48.1793347174376;
        Fri, 30 Oct 2026 00:59:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4986:b0:3a7:da33:ff2d with SMTP id 98e67ed59e1d1-3ae89849d1amr1192432a91.48.1793347173818;
        Fri, 30 Oct 2026 00:59:33 -0700 (PDT)
Received: from [10.133.33.77] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845fb9f6sm2969811a91.17.2026.10.30.00.59.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 00:59:33 -0700 (PDT)
Message-ID: <e4b963f2-84c1-410b-ba92-7cc914294a69@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:59:30 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] wifi: ath12k: keep regulatory frequency ranges per
 radio
To: Lang Jianjun <jianjun.lang@ntu.edu.sg>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "jjohnson@kernel.org" <jjohnson@kernel.org>,
        "gsh20040816@gmail.com" <gsh20040816@gmail.com>
References: <SEZPR01MB733849AC81EF5F9EB7B9B6F0A26D2@SEZPR01MB7338.apcprd01.prod.exchangelabs.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <SEZPR01MB733849AC81EF5F9EB7B9B6F0A26D2@SEZPR01MB7338.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HqVYcEBdm0r2TMSQpCBVV0q0NwSjHt2H
X-Proofpoint-ORIG-GUID: HqVYcEBdm0r2TMSQpCBVV0q0NwSjHt2H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfXyw/Nkb02IwVD
 /JbgAZap8gta8R4IOi2WOMyYc3LU597HrwUrANaYMZO1G3cpFZm80mSmDlNrKZBczDooBKU9qPp
 1lSGpV8cWknZAJYoJPIZAGJpxbKLf5//4dOMZHTFVdgc6O41CLLozeeql6U08Jjqz2LQrYD+HV8
 M+3cg7fprN0xC3E24gYGlBJ/9C1XZEUQF+XVi4X7vVfLa2EVyr8yhgDcuYNPmObjYsGeDISOMEa
 Zxqk/wzO7SoHyxGLGVh2PfxfNT8vGJqTQEpMfMamkZfgM2SAtdUdCKACF8fSqTbB9Q3L066ECZT
 v/RtABBqJT1aRMaWTsN4/yPbvw5AWsz8mKc1FVTl9mnyU4udAsu8uGTs+1BJu15LGzdad2A61+f
 Kac+i8iQSXzXDPFY9LeqeEHztKSEoy0UQjmhh0obEz3E07t4cdTLr/DFmulpoOKOQo0Jzipp3Uh
 aOEOLFRFkT/0cxJ9QlQ==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae44e67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=luFj5LIaC5_7LFMtheMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMSBTYWx0ZWRfX89wZ5q5MoKwn
 tXxLzUUzxQz1FNxzRUNdb7+iAqYQtiI5XdtAw0odG41l7K8RgRlBKXk/dV7t08UA2BNilYjrk2q
 u3zoTFwpfmq5JEN+GB0rT1K161fu3gc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_005937_259705_58E2911C 
X-CRM114-Status: GOOD (  12.42  )
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
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/30/2026 11:34 AM, Lang Jianjun wrote:
> From: Jianjun Lang <lang.jianjun@ntu.edu.sg>
> 
> WCN7850 uses one pdev for multiple bands. When it receives CN rules,
> ath12k_regd_update() skips the 5 GHz range because supports_6ghz is set.
> There are no 6 GHz rules to extend the remaining 2.4 GHz range, so the
> firmware channel list loses every 5 GHz channel.
> 
> The ranges also live in ath12k_base. An event for another radio can
> replace them before the first radio updates its channel list.
> 
> Store the ranges in ath12k_pdev, indexed by nl80211_band. Build each
> set locally and publish it together with the regulatory domain under
> base_lock. Take a complete snapshot for channel initialization and
> regulatory updates. Copy the selected regulatory domain and ranges
> under one lock acquisition so a later event cannot mix generations.
> 
> Use the presence of a 5 GHz rule range instead of supports_6ghz to
> select the 5 GHz update. Use nl80211_band indices for the hardware PHY
> lookup and refresh the 5/6 GHz hardware limits for single-pdev devices.
> Reject empty hardware/rule intersections before converting MHz to kHz.
> 
> This follows the per-radio design proposed during review of the earlier
> single-pdev fix. The earlier report and review are linked below.
> 
> Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
> Reported-by: Shenghan Gao <gsh20040816@gmail.com>
> Link: https://lore.kernel.org/20260715065218.41232-1-gsh20040816@gmail.com/
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Link: https://lore.kernel.org/9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com/
> Assisted-by: LLM
> Signed-off-by: Jianjun Lang <lang.jianjun@ntu.edu.sg>
duplicate with

https://lore.kernel.org/all/20261027015919.277156-1-mrmrmidoessam@gmail.com/

