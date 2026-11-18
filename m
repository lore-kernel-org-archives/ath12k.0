Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B21A606A320
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KAkgX5u4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=EhKag/wI;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NR8XV+c0;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I3ykxiav
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=GcKjBynMHYcg8LvKR2kfW/RPz6bEfNwDRezwNMb5Bhc=; b=KAkgX5u4QD+LBf
	gLPiy0naQQO5S0Oun7e1Ao/mUSyV1B0S2cIQ7NdKdHJxp3xvPA+zvWAUlJ28xsxHpMEibQNahINGl
	weWtaUm4NI2rAJbFqiBYGQANrNDXIazhO2XiyojP5GVa6njkTSCSuOfJkHc9YAvZPh/tzXFKSZtwL
	wQ4FgTn9cY9iuKcwRWSKHq/QYZhM6zjGxNB4WCpU8eTAyIdDwKveoaAP3l7o+RpL+JQ+bjq7smVmd
	3jpZyyOguXi32hc4Let91AmoeragJEoRdluIXAzDbS8KLLwL/VPcEqANSX+qxF1BKHcMwBc3uf5kB
	pH3MgLriqqsgPF/2I0ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1x-00000009f7r-3zTv;
	Wed, 18 Nov 2026 17:01:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1q-00000009f0c-3Z3I
	for ath12k@bombadil.infradead.org;
	Wed, 18 Nov 2026 17:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=GcKjBynMHYcg8LvKR2kfW/RPz6bEfNwDRezwNMb5Bhc=; b=EhKag/wIRVOsSbFGyClNxwDEi7
	XinLFpiEZ231s+e/Rnh9meHHmK97lecemEKpV8nNvq1KJrqkWabgfuYTrzJl9QIYzubBtaNSm163N
	FIKDEhNcxRv8rg37hl9ngfwVhdBikyX8Ftq50EI4pYadzn3NiTxtVhlOFnjmy3eA4RCgjAJmuRvis
	OCJ39MkdWoROY/MenCLtiauLSnBOGvn1JbL062eggkHpwyQ3a4atdIG7nrfAVV1gN1kVlQIIVRszB
	FgEd909/OFZ1s7MH6rRjjFcuFjnXBtAuflVmKzv2lomyrlB5DDT3pwnaUbn37zlTxsKtJuzHpXyWD
	q2G7FK7Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1m-0000000GJKq-3Hx9
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:01:01 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIH0u0t1807798
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcKjBynMHYcg8LvKR2kfW/RPz6bEfNwDRezwNMb5Bhc=; b=NR8XV+c01nJ0/yf3
	FJZugw5vpjzlnyfS3vyAZBkwveajis/75fFN2UQgesdtF1qv4+DKO1PHkfXb8b5q
	MSnFE+PqVoASbIDtU5PlprcNthKy06g6fRQ9MoVQtaYw/5Rn0BTBprHE/iDLmkqu
	wDVahHhtD0jiUTT03fbossy/mteUnD0CnCa4hzKJASnW3gnZQbZYFKX2cukfmlGF
	mGJxXptefUnJus3ZVFwrwFJHsAIuNNrrlaWlkdoWsO+BcYgBmEp8gpT6reQWzMbl
	1oJAHggCs6cJHjQKM3xDbIRaqol+WatIylrqfYbo4bqk3J5z/6FliPupaVS5N6tm
	izAiXQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dnrrtny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:56 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1a71dd190b0so3213623c88.1
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021195; x=1795625995; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcKjBynMHYcg8LvKR2kfW/RPz6bEfNwDRezwNMb5Bhc=;
        b=I3ykxiav8lLh+rOgmQKR4YdfY4PCetyFuGTjo04pn6uZ5mEW0PkHzCCFPDd8wfObqm
         b1pW492ElVIBnaTdUXQvg5lx5jLCH9Fv7bdGQT72JTN364TImcZ5xEgBkJH4Ihpi/D3x
         8/QZ1DBH8kaSABPFXA61vy1pqBjqI83LR9aJjqAhuTDfHCGsnDPglPtuap9rdctgJaN5
         qTwSad67raYxfNpgj0iUX5ZGGQzggdlNhsrGXhfHL7/lDof8RZQuTCu4LKwHKvoURs/o
         +8gf7id09xT+liqtXX9hrr9lZMivKkH+Q5MDY03DpYgaVb2eFEKyO99xIwQRoybD58oU
         hlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021195; x=1795625995;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:to:from:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GcKjBynMHYcg8LvKR2kfW/RPz6bEfNwDRezwNMb5Bhc=;
        b=XBE2ZXpAFGXnl2pYfNx+hgT84PcpV3FLaAjPFC5qxmcFqv1ncJzMJoUQqHjWYGRO/O
         XxChfI4mIuZb3rRHN1UlCzex4e/zjGviiKLYmWTtk6EUXNCXIXc7JXJ2egYOboV4r5US
         ZI3dlDjR5XnI3qyqxGGxCYL4/nvooQKu/xaTDkFUnxdZCWXzlbShWEj0dJ+ckwiCH9HU
         SsxVQrruJF3A6nXpZvN9R5e0/IBQ2fMPDQ90ezrMIdOLp9ON0PmLeb636euRTXFo2usD
         lu0c3JfB0ofkVJqbVNTVOcV5/SOPYpR08bhx06dNQ5wb+jgXSWItFtwB72dUv5eMKTD+
         C/VQ==
X-Gm-Message-State: APuU4Z/yr2Xb8NlmH5ttH/YF858MRdlOjqQ+BeGu9nDExBUQadEzi/j4
	lQK3s9Du8oZtefuLvFsHuAiJrYip3m/f8RXkDA0rfWE+gL8yPE9XZvfYShI1sbqOxQ89luda+gi
	QdpGHCCS9CmkPCCzylrLBx9A/AV+WQuEv1gietRRHGiM3LRyS2Rs3wDJ4918VjDY0eY7sUQUD
X-Gm-Gg: AYBFou3tX9RzDzPG01fuNbL0AXejTu8l1nO6r7aoFBqxQfuG+wwYjXOiBo8Rx6B4mkY
	CHUYGVXPmp31xxn40pt0c5P7LiRZ/ffpGRy8ZSqCnc3q48iwEvv/1203l3XWlry8hJcFS+LBP/G
	OQ9T4aWprr3uxp1NGtnm2cdMy23lRrMb9OCzQieVHYZZwO66pTTdMQwo/496LLqAQD5CusgoDpQ
	Pmru4rwT/jMsjdWH1ESoc89Tw+T8YOTFOIGURYEgiFBut9muuPi71MtUDNi2aXpIVvg0XIitAaP
	Luj9kw/95azdN3NCCyh7NeA9HUJG6GflxlEH+HuT3/x+GdRDelmUKKCeXDubnr1IZcxF77CBuh4
	F8KHUpYVqnoctcroxi0vVrpns1jGInLNOSeMpz/n1xFD0HgAtB5qRtoQZje4NVmxyY34nZk7sWr
	3Lf9gyeJjR6GVB+N0/UpJiu8FL79Fs
X-Received: by 2002:a05:701b:4348:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b543b09960mr2764535c88.6.1795021194714;
        Wed, 18 Nov 2026 08:59:54 -0800 (PST)
X-Received: by 2002:a05:701b:4348:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b543b09960mr2764515c88.6.1795021193992;
        Wed, 18 Nov 2026 08:59:53 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.08.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:59:53 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>
In-Reply-To: <20261118043323.495662-1-shazad.hussain@oss.qualcomm.com>
References: <20261118043323.495662-1-shazad.hussain@oss.qualcomm.com>
Subject: Re: [PATCH] .mailmap: add entries for Shazad Hussain
Message-Id: <179502119325.3425953.398212862714305796.b4-ty@b4>
Date: Wed, 18 Nov 2026 08:59:53 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX5oDIB1HPgz3J
 dZGK3o4+RFobWBLw/XRWOoLltkO+7tUNuZ4gjzMN0kzvH7sQimLlMH3mWdIaLzM9amVZeQCMZNB
 b4jq9OTVQvZgTwFo7uY8I6fBE1lYf9hZujBZkqRBKwZWAhEznvRombWKX6S1H8HmiNKuRODewKs
 Vg9LdkWD9+2u297gS6cZWOkxN8S918Kzz2Dt11ub18G+e3vRjN2DGbBGtMjmPN68w77zq2Z2ner
 xff/qL0+/s6rh2B7tZghcqPYdZDaW84IIASxFdmTsAmZ1r5o/O+TLkKy/Vg1Bpl4qPmwsyq/7X2
 xbKmW49pUNimq3TOcwFsAdRCmBwfE/MFHBV6XAPwXVkW2Dsn4lc7XXlsGaCoMBHbBhMWn2PvyM5
 6zKdc8GvT8iqbd6/cT8sP1hy0m1NEzW7dTqL3PBUV8UmEM2scJPytnhraYFL3fc9JRbpKG+BSme
 rp22ZgEdLL35zPo/MUQ==
X-Proofpoint-GUID: 6lNSxs0tTK-pPN6UB4NOGQ72t8xQajlK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX60aEbMoIUlee
 Snz4B/1/jOB8dLfWpH7BW2L04Xeu9En1Kn84xrVBpHXGmRwYzjS+0tLHV5UUAfdjiS65WivI2sd
 0wkqhcEsqfXCP9nZF96bMaIPT1Jb6mQ=
X-Proofpoint-ORIG-GUID: 6lNSxs0tTK-pPN6UB4NOGQ72t8xQajlK
X-Authority-Analysis: v=2.4 cv=bfH+w+PB c=1 sm=1 tr=0 ts=6afdd9c8 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=O1lZHkqPMs43zl35u7IA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_170059_049919_C659C33C 
X-CRM114-Status: UNSURE (   7.92  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.9 (/)
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


On Wed, 18 Nov 2026 10:03:23 +0530, Shazad Hussain wrote:
> Map past iterations of my e-mail addresses to the current one.

Applied, thanks!

[1/1] .mailmap: add entries for Shazad Hussain
      commit: 48ca4dad0aa29bdea82be87a9a865ee28faf7fe1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


