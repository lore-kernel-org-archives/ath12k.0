Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8A02CD13D2
	for <ath12k@archiver.kernel.org>; Thu, 30 Apr 2026 21:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JA35kG8zZYw0eGflbjSV5/3DiP55GPnTfmEzbk3/pd8=; b=qMLICrkDLq+jU3OYIxSBacpX1o
	QLiFIDd7P1cGSEzb5g0pjHSeO5z0Fq53PwGcfxwQ5A7hyc2A6msa5wSDSMMTKpgVQ5eCwBvktzcJZ
	Wmr5AwYgODeBN0RdESzXi124+lZbJXkxwcaeG6M9t+1n6vsgyMsBXj9ythA6hpO0AuGHDcUAf08+R
	jaLeXwYpOTbagUw0q/IC661PDP2YdQW3g+nWlIQWWszkqJwjRx8ShyTfs3DjErfnZIGOtjSY51qij
	HH1mN/6XaaKorYD9jMH+/7YZezVcON51PqZJrIqrnQC2KIcErIBWShirW466PFXr2EX0eYikG0VUb
	1096rYug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyO-00000005zEq-2PKa;
	Thu, 30 Apr 2026 21:31:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyN-00000005zBk-0as8
	for ath12k@bombadil.infradead.org;
	Thu, 30 Apr 2026 21:31:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=JA35kG8zZYw0eGflbjSV5/3DiP55GPnTfmEzbk3/pd8=; b=F9Dvedo9v0cILzFt22yvIy+nOX
	v3oIBXzGWhog6QLOMW9n92trLGGLA2CDUU/y+LlJgVLSuaqmgUxgRivB38lIBih4xTL4+Jfl+8WQT
	lMxhXABolMwnJLKqtM+WBzDOzzpAjPjc5ebQQR8Smu/fvUy0xLiDCrNGtSKY2GNEG+hY3NsIy0Ary
	bifHq8NHPmIQOYTwYFTGFEEgkRYfJaYGWHb36AW4sovMLbNS49plWlD87tSPehrGyQtsao2Uys3x1
	+5isWXRuBnxSTlkH3XAIZMESbo7r3UXnpYqpHxcOXahmSn8v+gf8O470r4Iy6fuDqwmfqWPsnxtZz
	K4fyIyFg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIYyG-00000008B8q-1Bl3
	for ath12k@lists.infradead.org;
	Thu, 30 Apr 2026 21:31:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UKIFXG1854189
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JA35kG8zZYw0eGflbjSV5/3DiP55GPnTfmEzbk3/pd8=; b=KNy6/D91egg6H23S
	5xtep9RhB5T2HVeXMWlrSbCzYnMIasW+ulcLEd6MsVe0f283LhKl2DwpwkbkHHUg
	eX/Fn1GVhxH2L0mAnOwh+Xq+9bV4Qio4eef+iOSPctaNdTE0vLU4E8SfU+HKsJlY
	IXQCnBIIpJhxvieqItXOD/rV252q2v4ZGqVOBgrKNulu9v3nNk330KuBOq7znE82
	mLSWA+dFYw77K1LQNFhyk0pI3f192dI607GItSzdCCBYSEg+0NAMTgSEk7pKGIrB
	v0K6M3Jr+sj12mxzPNZXMiZiGK7/bS2iqIyPBZb2MXcDv5B5YYgd19P/R1PxLEWn
	iPAxSw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dve0g07n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 21:30:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2de07c12745so8903441eec.1
        for <ath12k@lists.infradead.org>; Thu, 30 Apr 2026 14:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777584654; x=1778189454; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA35kG8zZYw0eGflbjSV5/3DiP55GPnTfmEzbk3/pd8=;
        b=ZtJMKPpsrKMnJXmetgB5VbhObHbujtmmZyciY5zp9tRAN4yehyVDL3xQeG3F3kBrOS
         GgoshsF4711lp4IOg4oyZQmDqzyfHPLeH31wtXIEQZ4o6PKr+SgB6p91Mth2PtMomgr6
         K9qTbqQCOmW/DUEpmlxdhZlgHUYBksYLT4Zd9/CsKEbeFdJ7d0CHr0D7mdg4mnqD035V
         oUrmtdZ8mRaEvemRJ+iSXryEXPAaJLYw+8wJx4VFgk4oDCgYUrDhD5Nqq9SOMfuVRI4e
         5kSBWImQS279eVK/ZHojg61JUXrOA7DBiE8SqFE9dBEnspQ0XyRvDoYeCJJdxkzFQMDI
         xx4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777584654; x=1778189454;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JA35kG8zZYw0eGflbjSV5/3DiP55GPnTfmEzbk3/pd8=;
        b=m10mF2mYQA1lJXwflX6TBBSZum0rMQboqybV3kjhmYP9NYQVlKEAhUpVEJGWyyHQuP
         iKMKC7y46OsGt3Vt6RuvEDqOooSHzVdxJDxFYKxz90pBRFAhw9AlgEuLSlTOH0CEKPDE
         E0v4MkYhEhPcMDfvnfoYxsMISSfaIiNh031g0oaAAV+Yofuex367c26g67jMbinHdWgV
         mPpE13GJlIoKzr1ASM7AkRK5MIKHybnf1kExadESi4aRO2nba7pzjD+1jasKCS0pIibt
         RMNFdxovB2mkMnH6q8JruiKquHGJ7sAhUlOQcWLBeIK4mPVb2i1wCrJbAfigGKr3dBQp
         71Vw==
X-Gm-Message-State: AOJu0Yy05q+v4kNVD+/c7qqS7GIfHHZAxQnIvmkVWkjCxhqvOTpaipqV
	wCZb4WXFdZlfdQagK9BD5wBR01nvEmxAX3j53ZgS3fUiKWpnVqqXdlnt54Nm4S7yyCTIuJKZU8i
	u60E3aFVxsFZRSheu8drk2ekgJUMhCPJuL5Iz09DJ5qmSW5+yn/1UsqW21SKfYCyK
X-Gm-Gg: AeBDietmnFNkcDLAJwYa9hFLWYV3iLpA1o4tBRhGROTNrY2Xy9+/m8Fj46pwgdwd2qF
	byCIWqnutVUNkO8+WUC3m6WlfYUJdGQhg093+xjipYY34WbDXCOnIOSt6RU2rGUrDouMrnHdWiz
	cGIGROczW1IUJzK1YA4EDkN/O9tFtLVxzOVK74q5d5WJd+jcUoNWgGoj+3PjjCwr7Ap0IXk/yq6
	ckrCA3g5ApNxuwpCxyjAQQFLWVJK7u9pYw9A0l7IyGYhoBs4WMYrwQjb3eHlkCs+qEqlCD+2tyz
	5GVbzrJQ3jfcWl8i6qG920fCNzH2RLpGg4I727zZk5MarAtQuQbYneg975pFKG/rBFnUU3QQng5
	AwcoWj/6oBsr/Fm0TSua32CawG6BSzhsvxUFD4kwThd82OCOJ7SZmqfwD9cjPNWFIVKZ5W+04m5
	DNwswwnx+LL/c=
X-Received: by 2002:a05:7300:7fa3:b0:2be:2953:fd74 with SMTP id 5a478bee46e88-2ee86bceea7mr191383eec.14.1777584653953;
        Thu, 30 Apr 2026 14:30:53 -0700 (PDT)
X-Received: by 2002:a05:7300:7fa3:b0:2be:2953:fd74 with SMTP id 5a478bee46e88-2ee86bceea7mr191368eec.14.1777584653418;
        Thu, 30 Apr 2026 14:30:53 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38d79eb9sm2504861eec.8.2026.04.30.14.30.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:30:52 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/5] wifi: ath12k: thermal throttling and
 cooling device support
Message-Id: <177758465261.1848985.8700721719961133563.b4-ty@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 14:30:52 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=EpHiaycA c=1 sm=1 tr=0 ts=69f3ca0e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ge_05e0WECY6XzHol0gA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: hnpWUQAwtRyWZmGplvLbbCdxbDR0ECn0
X-Proofpoint-ORIG-GUID: hnpWUQAwtRyWZmGplvLbbCdxbDR0ECn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDIyMiBTYWx0ZWRfX0cXeRtm4GsTr
 g0sau9i5u38YB15EZQE17j7zkirIueWYqqicgkYKwLJGSZnXHsoa+4Ti1wTmNZa0/yqr9utZoMH
 P0GEzay+nIVcBxrtD0s8wwuh8geES3x3Xxy7qRDJO/kBdAGIMFIkdVdHr+HT5/1+cm5ifNMy5HG
 YhdrxZh/O2fQmHpsFRygSXSPcp9wxlX/wazSJ1TGBIzkghpL4nhHTtSr0cV3Jb12wUDFVEx7kku
 t3WR+1ymzdvHQsuxy82yroL9pGl7mNLXbYPoHlBtsndDYUDGTNgVvzhxUdctGmuwZ4zh5PZVsrj
 1iw4ruhcg4FgyGdsTrcH4lgtar7c2XoIH+dUvL88p6K1qhLBYWt+3mGbhIVZE1M1UZ7rTiMnUNA
 9c88FjqZ914WBZyMq43UBeEdfZ1+AvkFGsIh3ixHsNvu58IV0ewJpgB/4Qj1urksyqDdZ2redCr
 H2R0zDL5sC//GpZxFSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300222
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_223100_522825_4A9D99B5 
X-CRM114-Status: UNSURE (   9.09  )
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


On Mon, 13 Apr 2026 21:08:35 +0530, Maharaja Kennadyrajan wrote:
> Patch 1 handles the firmware stats event so we can track the current
> temperature and throttle level per pdev without spamming logs.
> 
> Patch 2 enables thermal throttling at bring-up and programs default level
> tables to firmware via WMI_THERM_THROT_SET_CONF_CMDID; the driver picks
> IPA/XFEM defaults based on the firmware WMI service bitmap, supports 4 or 5
> levels as advertised, and only fills optional fields (pout reduction,
> tx chain mask) when the corresponding WMI service bits are present.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath12k: handle thermal throttle stats WMI event
      commit: 845b613b57c626ac85fdefd47196acfb3172fd49
[2/5] wifi: ath12k: configure firmware thermal throttling via WMI
      commit: 612556eb774f19f0ad64b5f72e890943b95a1339
[3/5] wifi: ath12k: refactor per-radio thermal hwmon setup and cleanup
      commit: cd93e8c23ebbd72e9aa799199b14c8433585f747
[4/5] wifi: ath12k: reorder group start/stop for safe thermal sysfs cleanup
      commit: 0ab4dc09b7819ddea698fe5a0cc711a64186f12d
[5/5] wifi: ath12k: add thermal cooling device support
      commit: e12d2d3983acb150fd987d19ec6a2a530da110df

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


