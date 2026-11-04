Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49132606D808
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 18:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uIWJxFfS;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oL0yYGPA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=itnCft/e
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=; b=uIWJxFfSX3b70N
	l8X/9CTpj8xK/op0v45JmYj4y/P6YGkdWh3ew3pVEBFyhmskWBChcUrCekjRQ2iCTxfQcBrvUBJlX
	KJ22LUBrMt0oeN7XnldYT+lVmiVa10n4qu4LE+XGEjw02LoHGm35N4V2t8csLL2sU/0+A/3tR0OkL
	0wfFweq1mOCdRDeyY71QuYmVkjKGa/8mG+DQ+6h1Iz3KGP4xAYFfAWd733nuPkJlvSU+RP+vRlFxv
	TnxH4GZjRr0JXPtc07ZZCh/i4Wyb3y25YRHM1gUd/IvBAEY7cwi/AY8bBLsMq6d1FfJXpcF8VKaki
	PKFaYx7hnwf3r3M90P6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgDE-00000006VLa-0Wlc;
	Wed, 04 Nov 2026 18:59:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOgDB-00000006VIw-0uaF
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 18:59:54 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4GUZsi763880
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 18:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=; b=oL0yYGPAouoaNo8S
	qM1vUmyDp2purnoBDMraK0tUmAiatZo0Cz4/YPxbeAhPWg7ERgppywjMs9HOnGuX
	RaqRHfCSOXp/GR0vUsuS7nButWWuHFgNse4gPobVoOI5hNlowWwqSLF1XtJoAt+T
	C9VQ9q4UM/SNPqZfAMg7m2R9XFNNFGpaZfN3Ibf6aZ+9Autil478sirtJufV3wM+
	hPSGjUWVAVXzT8KA1/O+R1zAHSyvawZpJ1CaVzfWmDs6zxThXChrW/uC8bobaeWR
	IzebhghazIQxwaK09eWiMeBrsMsVbI13KCt32j2pyYjsBexEgt5uUQ2fu7PO3ljn
	pSkwDw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr89srp2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 18:59:52 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36cec75d8caso963107eec.0
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 10:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793818792; x=1794423592; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=;
        b=itnCft/eHZ4FHMewYpO9wobGK7V2I4HPSR7e7zq0iVCD8WAU6ApwZUFVNF4jT89dZK
         73vaVx/ireY7GeLToaJMFgSxv+OJhSb+UVoahJNTOvEDyQn8lCVhT5Im4C1Xk/yDslzY
         KrhE3950YDTPXCh9o03p+1YSWFMwyD3kGGKvm1qJG/c6ouuNV3mktPv28U7rv3o9O03t
         nd7+IAUqA4YQOwEKI3PNrj2/7lpeqErVCjjwTk5UmpVy3+5LBTg2YuJgDEJkU1atf55+
         e5cEmivG6tFFYdBpb0A/6PAEW4Omu4xQ6Hl6UfbO2IVf1bB0j9+RvdPgi/lp6Ut0YyP2
         IxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793818792; x=1794423592;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+AL3vVJujoQWo6KzL6QcnfTX/uMtvYEe2+sDd+kjwIo=;
        b=WFwPz52vgWLxWUbsGmom6Cc4BnY932IiC7+WXZFScYaKGRPWKExtwI5Uigv3zQQ+Hz
         irls/9CejrDe7cK0TmB07/YFnExfJTdGmaDi3PlIS+/kuNeaaUr5KgEdOsvBuPVpT9En
         o6ycKbBW2fpcykR2szrrfsggg8Ke17kzpht2iKcCiU6ak4KgiYaLQXo/U+LEm5ELApIb
         1dj1L1DfM46V620lnTDe+epb6WSmCwMkb2foPqcBXI9kgKbumGKNlVNnVhfQ/hPzH9hF
         YYVIltRiucU9qy9DkGbt1X+Z19FswNzb4EldGbQiVgyCxlMBTuE0zifo2Totl2+77qsY
         nVZg==
X-Forwarded-Encrypted: i=1; AKwUvBwd5OR/VvecB4vooNdHT1qsG8eQyRmlAJpTig148u+VuWv14lbTzMlbatKM0WbLKJTICp1FSvc=@lists.infradead.org
X-Gm-Message-State: APuU4Z9xb911KaZ+GPKNxS2nke9g3kY0X8zQJQ4ahCHZtLLudN4Cz8mx
	5d5m4HTIo3eRxqhGlq9ALGJ7jS4w2PjOzR9DEoeDIKL2+t6/zRMSClVWQQ7rEKVDWMPhQ3kpvx8
	UNpubJZyMiXcaa6irjFfshqZB9EEb+v5tmu1dxBoeuFuHVsfTLEeID1nFnF/O2KxzeQPqaGw4
X-Gm-Gg: AYBFou3a8dzy0aeXyXbNdBAYR0RscEzBAvGxkHEWcrSmcnUbVU4JLZ3bLVgwK1bI1BW
	8HFKmoDPFYtNluhe7bHALXBQ5dMKyPnPhXIynuNPPC+9dLcusJkEgKSqjrJL7QVPlvl9AkRQlSq
	Ks0ffZ6BFQOqKYLpXwsZiGF8tbtuM+0oBaNdQFoOK2YdT26VXuSv/iO0VCFuFubwBu8gMe3bHdB
	DoSwlIUbXnDSOkuMNDCiYLA9i29XRxHdcpD3emnzo/+TszR/8CSE2SyEhdx0ClIdIDwMogyWr1f
	PoKMg7eVwOpAv3toV3srxH0bIorX/k4FrXScZtveQJ985ILkgE7pFt8MGxXFpeKr4uY/1TrYeYX
	Jxh0bSqZ/AUsnN0kD9HLbwHnATEpNpc+cPNOL/rTZ+n9wH6xyUj8CeoxA1Rp3F3VqVDOJDeWjBV
	mXCOK9sTXA9nPhnXa0STMK5ffppWg=
X-Received: by 2002:a05:7301:4710:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36de4d892a6mr413655eec.9.1793818791891;
        Wed, 04 Nov 2026 10:59:51 -0800 (PST)
X-Received: by 2002:a05:7301:4710:b0:36a:79cd:12df with SMTP id 5a478bee46e88-36de4d892a6mr413608eec.9.1793818791183;
        Wed, 04 Nov 2026 10:59:51 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm14596861eec.11.2026.11.04.10.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:59:50 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc
 firmware memory handling
Message-Id: <179381879048.1666903.4827075101285181405.b4-ty@b4>
Date: Wed, 04 Nov 2026 10:59:50 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: 5UBB5hEl0gPGbGAlBcB2MVooXs4LSY64
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfX3wzBsTImCrrJ
 VKTP9kCZL2t7JDvf1iZIKjmA+xGm1DrbX8799SI6g+kVH4AT+pf3s1T1UHzj8YMd1TnsqqNU1r1
 XF2Ksy7Pth0REsTZ5zjaORl3N65+7J3PpiwYx+B/0oPSD7bvWEgr3Vqq0wdjSFhVQN8S3pnIQ3f
 0co83ny1sQ/AlccadEP6D2PUhQStZB86fnSpJEtJjsTCmO6GgfXEfreJmqI3o7hUvzhHvu8yyBw
 p4w3/MYbCaV4KfGmTx+2TtAQeI2duEWQ/vNv2FEf24eNR6IsrnPBPpSRajnr0Ny66bNAAopRHsn
 lIXkvRkHl/dIJTw5UYdqusECtljJhhkmXCa8CtwVUVS3u5xv2IEKUq/iM/h7hTYZ4x7GRf4kGPa
 07frU/hTvYR1OW02LR5tfu5d5uKiJQaEeg6htM8+hTG8TzvgEkQjuIE1pXMNOBAOnUHrMqQ9qEf
 chZZnF2oYFdneMSllsw==
X-Authority-Analysis: v=2.4 cv=N628hG9B c=1 sm=1 tr=0 ts=6aeb80a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ZdJ8wbgfcnfs_pdWuegA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 5UBB5hEl0gPGbGAlBcB2MVooXs4LSY64
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3NSBTYWx0ZWRfX4m7iw6YIwHe/
 /lke8r8uWDjDgvHgxYO45Y0gK9s87hBuDF+2D0HctKChDa8WDZFxZL63jJRdSaYznbqI4ewS3r8
 EDJgyiIeoMqOdaxy5gP0C0LIyExrk7I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105953_364434_D937ED29 
X-CRM114-Status: UNSURE (   9.99  )
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


On Wed, 04 Nov 2026 12:00:06 +0530, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
      commit: 8a2640239052145072d1ee53d014b4a544b011b9
[2/2] wifi: ath12k: refactor m3 and aux_uc firmware memory handling
      commit: 5c8eab13e391aaabd5a1ad58f3ee4bb10ce7573e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


