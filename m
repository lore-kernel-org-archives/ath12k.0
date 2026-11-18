Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE750606A332
	for <ath12k@archiver.kernel.org>; Wed, 18 Nov 2026 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MmjLJ+R4;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aZu5WpWx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V6wJiSqb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zQJuWSMuU9iCfIN7hJB6jUDebKufSgMltA+vpmZth/I=; b=MmjLJ+R4jU8m4L
	iWWH4tbH7MNskOveajtxsXlDjL7HPh6eoxda6neV7bBg98Sw/KqpU6jL8iBGTGI1u54vABWqzcGlK
	Kfbh+WHV6KmWA+mTZpe47gC4tI2/SnzILBAtuqA2WRXAtNqmQsisG3cr90Qx18LIo98bX4kgPfvJd
	wdN/BHcyvhw/cr8I7nDzw3rQvv50EkcEwL2YRxK3nTp/Pk+OXL8svgbnDYmvdnoh2r1Juhrgj3HwH
	1QsGZtP02kaQpQqH4PoOn4jdsVzYywn6igaMzzy7k6XLTdiQX9nL8RQSf3RoQ6yp28Efz9mec+plK
	vTMW5bLNSSuI0Cw4zvbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1W-00000009eoX-2eJq;
	Wed, 18 Nov 2026 17:00:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTj1R-00000009en5-2Uyy
	for ath12k@lists.infradead.org;
	Wed, 18 Nov 2026 17:00:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIGwK7L360172
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zQJuWSMuU9iCfIN7hJB6jUDebKufSgMltA+vpmZth/I=; b=aZu5WpWxtkQgJcdn
	4g38JiuBjuaedL/JFrSJUNM9RhVYupMFNxS6XVC/5Z7CN84M1qS7iSgaA/diDWdW
	vIsv9to2EZPeSkZ8ZHKY6seSuj4N/XRMdrBeKQlZdAS3FQtVpZVq8zxuaTFg8VAw
	hLIsDcFlFAWFtacZqkvk4vWPzgzLjTQIx8d2Ls3kNLdT+IV8hHi/67gdvTsYOyDH
	G8OKEstsINXuiTGjMFktmVdPK7QdpcqS011mqrxyu6IbchTcER06gAahMKL0anOE
	J3NjE8OQv/oaPCHiKmAL79SD+3HZLWL1/iOS43YB9aRhqz3TaWQykGqZoyy3pkGQ
	SpfCGw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1e5qrk1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 17:00:37 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so3660082c88.0
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 09:00:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795021237; x=1795626037; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zQJuWSMuU9iCfIN7hJB6jUDebKufSgMltA+vpmZth/I=;
        b=V6wJiSqbAHiFnV5l+5ZUJ8XOaT61XzZIVleB3jRlgSn7gmVab2Ye7VlvTT3BE0rXUG
         jUyH4URlLWxyldlcStmWdloQU7dpFcK3Br2UJzhgSvoWLV1RlzaPXHI0FMbiXG7aDTYh
         lNXfDzRvcdy0Bc18IgEKs9JUh1rm/LQldHc8gDxyywTAYT0cGzM8TSQAqBBy+bqLPJTg
         IKYPen+Ka6oq+bYccItju6NjX3cQlA+IROkAR7+igPbV1vgK51uOynE+ClBA6BSti3yi
         1UR7u80mdfj3N/EDJF8PKLHYeiRKQ4s3sOgUrrq/RqakcPRTjbuytJ+hnbywm/lu1fkB
         p3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021237; x=1795626037;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zQJuWSMuU9iCfIN7hJB6jUDebKufSgMltA+vpmZth/I=;
        b=hl2WI3txAMNrUmMHf98agkPaYh5P7bLWQgcxvx3uolFCD6tfs1yX3ErweBuHQJV9DV
         De2MpaXdfyJYgyMqI6vmK1UpPYaZero1FgEhzcigpOv9wGlSoJCLNlw7COZi2ubwQkID
         3DehGCZs/uWWWuR0FZsOxcq2OIMaNtDejwHP6gQSXDVaJX3jqxUqw7Hcmx8GhJalIJcN
         C0+XSbOExIe5nz3ha8Onpa0nFt/+YEO4r7GiACWEg8HoX5V55/h4SBPKsyebfneJbDmo
         N8OlGcZ/WSc2M224VgaYkOHZUArlQBHzVKm1SIW+TGDF0CQK4fJwv+Yq0tpnkSKH7X8/
         h8mg==
X-Gm-Message-State: APuU4Z8Z686PmynFwdr3nqAjyforbCXLUaOf3aHBt2sbPyJA1FfFDZr+
	+VoFYaR007EPjJDd4n0v+xM9I+PioKDyriOzS7t4p1wneWWfnRIWEjAcrCeYiEDLjJDyHu71Z0g
	h12/kHfGbrG1du3eDf3v0XlWeXRdV06yF2Nc+BnZ4c9WzJ4PnyR+S6ykmaWVkLIjysAKgacvv
X-Gm-Gg: AYBFou24OwML4wxfTzBxPO/jT+j8zmiBpmi7Lp11URiLt+xwxI1+frT9gyDZkJV9GzS
	yvPbh32PUp4yWZh9LHIygK2FOdtA3BE9CIlvPtn/zgYVWNHw7SdoqYmh2vpLCc8JBSmRpK659KD
	+Iqqfi8dIcjchaRjC49+uFI0JiFXK3bHlcyro759Tqt7hANadxKK66QqPTNpUs8QOVbwoYl8d+I
	9iYf6XXafHcWepuAWm1CKpzZz02scwt8cNvSeEZBgT04jeirDTJ53N/FoyXrJDv9iy8YsganRqf
	X+IOVFJ1PKF8j64Y3OdAM7Ptmhgr94g5raWr+7G0l9BZk9pzgfksdSjkklTEriRqqNG2sbkr9v0
	3GRovB83aUaAzrtXWz05l5Rs25qk3yvE05odC0bzUN6XOIy7jS5HkzWdUfzfESCvZDOPxN7P46v
	l8wkPg4KQJgCJaU8pND18nveTc0Fp8
X-Received: by 2002:a05:7022:e2a:b0:163:a197:722d with SMTP id a92af1059eb24-1b543b193camr4319080c88.4.1795021236197;
        Wed, 18 Nov 2026 09:00:36 -0800 (PST)
X-Received: by 2002:a05:7022:e2a:b0:163:a197:722d with SMTP id a92af1059eb24-1b543b193camr4319025c88.4.1795021235452;
        Wed, 18 Nov 2026 09:00:35 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4e19sm11075662c88.13.2026.11.18.09.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:00:34 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org
In-Reply-To: <20261118-mailmap-sumit-v1-1-0c674178495e@oss.qualcomm.com>
References: <20261118-mailmap-sumit-v1-1-0c674178495e@oss.qualcomm.com>
Subject: Re: [PATCH] mailmap: add entry for Sumit Kumar
Message-Id: <179502123472.3425953.2049698149487343800.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:00:34 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: SvxFhwsMLKIOgv7LEw3nX82Tod9ns6Im
X-Authority-Analysis: v=2.4 cv=c5Q+0h9l c=1 sm=1 tr=0 ts=6afdd9b5 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=WtR8ZtE2d15a0JZQCWQA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX7k4aN7qvH7/Z
 fN+k9/S6N0zPPkIKF9SRoOdmGYIJKrJA08EzWRNtqfdjful8i0zIwawzJ77c4646BhwqsqPhu9X
 wpnjeVbRKeWslob+W8c2vZyutPGksTE=
X-Proofpoint-GUID: SvxFhwsMLKIOgv7LEw3nX82Tod9ns6Im
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NyBTYWx0ZWRfX3VqCuhwGASbY
 G+RNR3rYqPIdqZuIDIr6Sg7oVDCXBkT+4rzM410q+dKl6BjRcOw7FmjMamIy0vA9jXVd21TYOK9
 82zYVOV22gCkhUSz2xKIK9rZw2RPcuYRr5UU1DVLADOe0VsMBJjKbbPI+iTDHgfl98695pyh872
 s4akJGFxXHHtNsxxqe6j3pRh2GTxAMWZUCzpBlTSpA2kz1DFZOPaxu0yyvk8gWeWa4FEp6LXItI
 r5cxWalgeQfatReWPvIFbhBw4AMw5ubYyh94N4vUXKI8/x+llUwtLgHWufYT0GvDejgfiwOUr8k
 T/aO+AiN+mb4BTLRqJvABJuIGQYCOaaZeM8EfA7cKR4VAlgtL1wo5wzNAjtV2mdBcy1lnEO6sP9
 w6FkRMmArI6s6/f1upqHwsPf5B7nosWscMvfUurK+PXifO4in6jLeGg4O5lFzsTOgacVAUGH5Vt
 v+yxW7DgW9NknNphN1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_090037_880667_25C268B3 
X-CRM114-Status: UNSURE (   6.78  )
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


On Wed, 18 Nov 2026 13:32:25 +0530, Sumit Kumar wrote:
> Map my old quic_sumk@quicinc.com address to my current
> sumit.kumar@oss.qualcomm.com address, since the quicinc.com mailbox is
> no longer accessible.

Applied, thanks!

[1/1] mailmap: add entry for Sumit Kumar
      commit: fdab2deb2cfa276389b8445af540f4f2f0861881

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


