Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079BA606A893
	for <ath12k@archiver.kernel.org>; Wed, 11 Nov 2026 15:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X3KBlIxB;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ciuq+rmA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jbAqprsI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=; b=X3KBlIxBPJqdnu
	R8kt6tRUvQm/mfUvWmtdouAvnDPgJQamL2wwy4f63mE9jhn3cWnJ2INc0aiYLbRsqpu1OWrci7eZF
	S3bGK15I6/tueFg9SPikszjyfJbYIaOQefrY218Xe9sRA/w3PtTwvoTeuywt48f/E85nT0QOE5DSG
	llYi/otIdUN0+ZTkYwv/rtxUbwvwU2VG2R3MH9Sdqnz848bBbiMNrqa0LiqBGsdA85Gz0AzRQBu6p
	FFBVyejROzIikqbAyiug7hvHxZf6PK4XgPipAUkcNPzEfQeWiO4/LXqKzZtGVpJ5+qUWHsuijQLvg
	XVhVuaFnRn7+Mo8Zl9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAaQ-000000077KM-48wv;
	Wed, 11 Nov 2026 15:50:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRAaH-000000077Jk-482U
	for ath12k@lists.infradead.org;
	Wed, 11 Nov 2026 15:50:03 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0P7X1565804
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 15:50:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=; b=Ciuq+rmA2IWrsGYq
	5EEfbmBQvrDy3le3DRCW8QM8HFVU5mWWotthtXORhW0LoDU2fg3GowkZQhJ4R0Ev
	zfI6XFs2qnVX6wfk09982o9sU78248iD5NLnMeJP81R4BAqz5ZmKxW7WEMzYowe2
	f6R7sNp5EprZTCRoj87TEsiP/m4rai5wBiM10Qszz99UT6GHldVxqn0gzTAlOA2C
	lkvFUcdvKUUUKb2i+65DDsw3Qopstz7Alj/PxkmcQG5u59eW9+s2gc1fhUunUP/N
	YrB7QHmQBJ8R+2fsa5EVAwfY1i8DrWk20QFk7GP3Va9DHIOD1ZM4pC8QEaoQPK3s
	DeaCYQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvs4m0r0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 15:50:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3763bd79663so1472564eec.0
        for <ath12k@lists.infradead.org>; Wed, 11 Nov 2026 07:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412200; x=1795017000; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=jbAqprsIuSUBadl6IEerZ6CjsiKeWkDrHRIcPy2L4NCEm0glK6jXoEznX8XRuLD+cl
         sue58fSrvBui1N9fLEFIjwSa3iVNrzPnOwyl8oHCs+ws06CRiucWrfhFpJnRsL+g6fAd
         4b3yJU9f7YPiO+pn3yGaAWp90HWsNqZB273OS/Ns4EvLU6TGfqG+jHWbSYMoYhq6blnY
         bnleSbeYxVRLdv2YFDOORl4nUl1bTYxTdM8VL6WVEW/jRdAXE/91e1R/ZLkl8umWxQA5
         gWN2Rus9kRz5RD+CPY7A3ndhaSrzWELvVJ/IRPrtu5XY/w90Vr43eUD5/gql1bGlNdFH
         bnyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412200; x=1795017000;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N8P34AsH1fiSX6jG6cafAhHs+En/eyF0au7U2Zb8KIg=;
        b=mtDKvGnK0RcT/3FJ1CQwHWhd/EDpUpVOS4TaMhzbXqTgujVJRwBxvm0wiuDHKAp8gI
         A7Y+ETLMGOEQLOl/rHYPfGzJEhCXSeu9kn4GRVrZd20YQxSaWjk7BM2cNHD/DQ1MzQxf
         Um4ug/7o6FbAj2Ici4VaOFLncRzhixOAojPv3Qh7sqrvPIkvGG4XgsasYZ+cQMNT4Xvb
         yFOhV+s8VsvKlvbAd7FZ01geEaFImR6iyLxvU1Sx1kbVeXMd1ZQo8FrfGsWNSkauExhN
         m61wWeVrMUgRapNPaZrcjk8KOA5bzyPChwsBm6ahkqTtcm1H9DbqvKGsfAoK8UzA0+1Q
         xQBw==
X-Forwarded-Encrypted: i=1; AL+hErHZaMnoJVDyhGlmp3AJTreN/UZ5QtOdXWs213Drsj5DKrBpklwMeZ5DzMpKqJG5BmlB+cfB57k=@lists.infradead.org
X-Gm-Message-State: APuU4Z+vZPgfWIki5r7UHsf02p6L4SMBj9YJ7/vKx6fYu9QQWQm9X2O1
	QPoPxQm5n29HjKlBRUCVbQLRpTJ5TsY4FiQlHSKCXKmaCnTXEAFvck1BuWz+fa/+2YUziqom0xI
	eTjs2+CFO9kADDXC1Iru7t6LiSEbK7Ow+eGrNf5GdS9Rl2W4YmY1OEhrlxanbKTl28F/VrdeW
X-Gm-Gg: AYBFou1yrkXbnlfKBG62MUiEaamLX+nXjLSzajQRS/dIqRGjdfLZ1kTd7zZ2t3jC2Mf
	nGR/5GpK0/3BBr1E6Q3DKvQ2rT2rx2ePr+P/9x0C/kDLq0a8GnUBGj96tlrb57yNwjWfQ+RD751
	fm5H0ZCk1pcRz/BSvAz7AqMJ2JdOxz3+0R5AmZdQgZ7CCRlQIKG809quayElzGABgs6QaOnAjm+
	y90HQ4P6MmIEo0hrd4C69x9EZ+0U4JVThAQts3EW7p58Iw5XyytviDbeer5DyJ03zVVI3fDGIIo
	ZLTtzSJlC3XIgiUV4SafkUkcGF5v2HYKQebHXh5teHa1lZF84kVHEvwwAOa2QQARirw5TFekbt0
	cunNGezmTQgFHMpITihkuvVYMc2w8yuM6BGYNQxSEW+aUou8dboqTVTZLY3qPHT4/73Oj4uQRkL
	IXvvg1NPMhX3THJwDKUtgwBM77TyA=
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049380eec.26.1794412199637;
        Wed, 11 Nov 2026 07:49:59 -0800 (PST)
X-Received: by 2002:a05:7300:f3cd:b0:369:1401:c5c2 with SMTP id 5a478bee46e88-3768675d71bmr3049347eec.26.1794412198788;
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c7c50sm33704924eec.29.2026.11.11.07.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:58 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, Paulson Raja L <lraja@qti.qualcomm.com>
In-Reply-To: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
References: <20261106-eht-ba-window-v1-0-622f2272e582@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Fix HE BA mode and extend
 buffer size for EHT
Message-Id: <179441219793.2984996.5664366595622303300.b4-ty@b4>
Date: Wed, 11 Nov 2026 07:49:57 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: WlviSiB7rfyA6DESJd5CQHz56H440Ltq
X-Authority-Analysis: v=2.4 cv=OYANnRTY c=1 sm=1 tr=0 ts=6af48ea8 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=br1bMFRRbvRTlr3IKzEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: WlviSiB7rfyA6DESJd5CQHz56H440Ltq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX0gNwU1FKOfq1
 X/yADgfqndpyLYY1g22QrLWDPxlqY5qs/5a8rUdjIL0kIhYUS9wYYUcJnCRN1l7JQ40zg88FvH2
 2FxF1OMoqjYqKVZ+Gm8eQpU08xkwEu5mbBXEsLOx0Cq3AfNmGEr2phLLAnDM6p3Tny7QNKseKQJ
 pkCn4MERiuYkHa1CFk+UqbFvx88S0V9suFuOWHtCfxThJOfckg5IMrgFV+uZLyYJXgrjvkEagS+
 wWnb02cPle5tqUEeVad2lMwjhbUKgKjGvIPU5x3e9Z9KF13fLV0LqqkylSNV0c64YiLaUihF2Aa
 zeQkW3QBkDhxV4kkknZ/IUMc7UfWjQ3/0iiTkkAPB2YVRIxJLdHk/JwQSiTRUB7/my6GHJLpood
 YMffLb2lDTGzV1LTfZHYfgKLe7cMZa3JIu2izOAhyFs96Q0uT7/8/Z6MAzIyVujIbCSCG131Hde
 PLy7MjUsVBqWzShHt+g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MyBTYWx0ZWRfX10CUjZezWzE2
 T5MAd7oL4iBzRg3wJP8+4cyWrpBneKXoQQFOOeysv9ipOThF6vO/Uh4vCJAPiMHQC8JyDmzT10t
 GKpzrNSgOb7Aen4AmLOb2lRXwe3SzXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_075002_169519_29259D9B 
X-CRM114-Status: UNSURE (   9.56  )
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


On Fri, 06 Nov 2026 10:27:41 +0530, Rameshkumar Sundaram wrote:
> This series addresses two related issues with Block Acknowledgement (BA)
> configuration for HE and EHT capable links.
> 
> Patch 1 fixes a bug where WMI_VDEV_PARAM_BA_MODE was never configured
> for HE in AP mode. The existing code placed the BA mode configuration
> inside the he_oper.params check, but mac80211 does not populate
> he_oper.params for AP mode, so HE AP links never had BA mode set.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Fix HE BA mode configuration for AP mode
      commit: 9b4da51a7d78365d920a10791ff216608239892d
[2/2] wifi: ath12k: Extend BA buffer size to 1024 for EHT capable links
      commit: ff4c7359e310744a7abe53cf66d921fa2969eb19

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


