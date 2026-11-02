Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5090F606A5A6
	for <ath12k@archiver.kernel.org>; Mon,  2 Nov 2026 15:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H5LmCFuv;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S3Y1LCXA;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLRxo/MI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lnNxXJJhJNYm/sF+ahjDCfCc02sPEv63IxnRELLXDoY=; b=H5LmCFuvWZz8+B
	AbIvlqqMDihQzoITebMdSa4f56j3MGBO8dzyt3jKad/05+bRdhB1yvKJYfI5KYQdEBNi2Ana1zcX5
	swWbNSjhRQX0MF93RKJUUzag+m5SxT3Phnf99QK6JKpsTfXjMLu2UWKmjn5Kyfe9XgQII2aubnfgJ
	oN9M6DDm91kMeLyTJqPcQ+Shf4blaa/8ONgBuSSvFShi/u8YjCJdO+NP8IhwUL5IHIX6HFk+6AxgF
	FS1cs/nhg4ydf+CyBJAsPy0vMxfieF+UYCaFxFGL3YDeDqCwRE+CFLkmgswdTiWiFwuVW0+shBEeQ
	D0fc9kJ7W2OaTl1XLWrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNto4-0000000H2n3-1y8w;
	Mon, 02 Nov 2026 15:18:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNto2-0000000H2mI-1sVF
	for ath12k@lists.infradead.org;
	Mon, 02 Nov 2026 15:18:43 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpPNH2449079
	for <ath12k@lists.infradead.org>; Mon, 2 Nov 2026 15:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lnNxXJJhJNYm/sF+ahjDCfCc02sPEv63IxnRELLXDoY=; b=S3Y1LCXAIggvtLKN
	4uW1qlzJJgU8iXBnd5eFF/lPznGNjz0Tvv80YogqOluYyQAM8ir0f5Vid2Sdyc/k
	onk1+Z0i99z389b+PHm99x+dThrkWbDkt6AcppG9GCfTw9qT6Yo/s8s7skOzJuKn
	yT2/oqy5jt6H+upEYkc68XoNz6g5RvHJIW43giWicFezshvqmktAJfGVcOX7zPIp
	FYmnncfGt09zy7tnr9LYr1kZ1uyXmadO11Q+5bIwRvaPYleNZhV6S6ZJv+FfLGOb
	e8VXm84EELFO4voOUrjJEn3GsbewFi0zV7x+6541dkjez5/fvT5vRUNzZQj5pct0
	GA8VTw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4jbep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 15:18:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so7375586eec.1
        for <ath12k@lists.infradead.org>; Mon, 02 Nov 2026 07:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793632720; x=1794237520; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lnNxXJJhJNYm/sF+ahjDCfCc02sPEv63IxnRELLXDoY=;
        b=OLRxo/MIlY8wTu2vPXC3muANcriaUCprcMV1+Tem1b24Urr75HTXOz0NsN5zpIQjtG
         H73638cmJttdX6t+Xt+ZWMB2ykrhJA8c54nTfxLmC0WF21MvfDyGTjQmI7GUdxdzn8Ai
         lB47xrGmJGXpgdOtlXno7DqOq5sWMC4kj7uY08HccSa/Mks5aBBSj9on5mFPOSfdgNeM
         +tZZuSBujwioRPwZ4zMn1wfqIqDD4LbH1LVcN4v9iiMwEbVigvo1pJZyijGZgqvKhrwA
         TCi6jUrTX27Mu0mjP/Kc3hB/ewalgWTexXxLoujFqzUWsqnYPl728D2tBONnVWwKlQgL
         FyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632720; x=1794237520;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lnNxXJJhJNYm/sF+ahjDCfCc02sPEv63IxnRELLXDoY=;
        b=BsI30nFloT2qp30YUqG0Le5I1wFmfskirUV2K5laGPk2oM+BZBzt/+5i/LF3CTEZo9
         We+r9pa1lbjEAXqKHfdb4Ce42aVt6gP5K99pQZfrocNaINg7JhgmwTCRVBBx1PQM0e2V
         m5UoZho2+otMJmkGOyDbsgsrKtD0JgOWvgO6JSUpuJ/8rvAoq4SzF8KT7pC6fNKAPchG
         ROiDa1QluiVbkulpplJ+C1bKorCvViezjkvj6FJIn5o0YBKxzuNnj2N1eQ0XGCSQWBQr
         kmFHdxY5p2+zw8o5YA1OpQy3Lt/LYW+mrS/vPZJGjTIXcEjmaKsbgCtCeCBuPpM49VG4
         CLuQ==
X-Forwarded-Encrypted: i=1; AKwUvByopu+/ZddSwZHsfrrVhqPW5BWS5IdUT8eX6qOIrzU7kKA5hJNRmCvBcRfizV4WyEmeDvO7bKE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/KMOYAvuEmGZteHjKa+lI2+lQG9JwWPugAMIg37Wv6SRkUbwpJ
	yFk6QEMuWdnhH/nrjc2X9dFZt9K1hM4+jvLSRbhUlEnYVLtlIRuxyuc1XQkzhQ2LhbVXIKh2D/R
	IG/yV19tEy5HrKqK2OKosJN2BMYp8e/rwUZzIeesQd8OM4DUK8ZemvKwR9y4sQ0pBZOvQhAWC
X-Gm-Gg: AYBFou3eNXNbQkAzy8+6vwAqITMB1ApqnzstqTXsNn47gqzLN1Nt6lEFqHJwqth74er
	cD5gSMd9uGqJmn9meE77ZM2HivRoYoPzYOATs0raZN3yGvG2M3BdDcVj1d6r/PCelw+6UZhnpAB
	DtAqskOQ2EFYnf/rejyzhsoECLwHVsjELAL+6ctPbi+Qu6Gu4l5xUtFYlgD3mYcN2qCs3p1+YUM
	uPz/yh2bfapthWT6u0Tsf9HY4BPH9RLcGQgnhzD+rE5sHzxKspVXzLJimV0ZXdmbvPxAy64aBcv
	UgrynsCyHR4prwoEqnBvCU4ul2hIdV2967vqGm5Cjlcn9FqZYewNivHRyPSTi/cHlKYAXdvlHOo
	wxyrKLz7EtOVLrDPZgErpWa4oDYXxZT+siMvhEWQ9qWEu4QY/5EIuDMT6St9vXv7RusADsTf2Yx
	FOMqBNnG+ZGcezapmENAZM4x8ZlaSQ
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr17630577eec.31.1793632720272;
        Mon, 02 Nov 2026 07:18:40 -0800 (PST)
X-Received: by 2002:a05:693c:69d2:b0:368:9553:f2da with SMTP id 5a478bee46e88-36a423f5c39mr17630540eec.31.1793632719592;
        Mon, 02 Nov 2026 07:18:39 -0800 (PST)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm45142952eec.25.2026.11.02.07.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:18:38 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Vladimir Petrzhikovskii <vladimir@dfb.sh>
In-Reply-To: <20261029-ath12k-mcs15-v1-1-3bcfab101f00@oss.qualcomm.com>
References: <20261029-ath12k-mcs15-v1-1-3bcfab101f00@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: don't advertise EHT-MCS15 to
 firmware unless we support it
Message-Id: <179363271863.1307032.2099713903992219927.b4-ty@b4>
Date: Mon, 02 Nov 2026 07:18:38 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: WUdHz1mvbIwknFihmJs15kEX-AqUJpHF
X-Proofpoint-GUID: WUdHz1mvbIwknFihmJs15kEX-AqUJpHF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX/vVXZ++GaTwO
 gYNUmrLbZS2yiEBqbw8OWkqI/Jy3QPx3CDgr7O5uuJBuCI4q+Z5X1u+6JPIsJHE60bvLHiK8QgP
 2+Q4Fw7XOXZyxOTA+08051ra41hVyJY=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae8a9d1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=l92UNcoUwmMchHTds88A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MCBTYWx0ZWRfX+rvtJnOkz81o
 wjyWuLskmsB0ZMMHwxMZLuYwa25cUMKFa80KzWf3C8lYyfQN+KNIKWV17WZZV2LRCTCxVm8BY/x
 8sR3x+/ZO+4bPyQprJJCw9FOAn9lAx7ZBHnhM7U8cC253D/mDnbkdYtOsfow6Y79C66V3T++Qye
 ZQJmfmOi2HSn2umB2NCNO8pRMpkXM5s6ltzbIrGhsFQ/DLRu84XDHIQkmbMZkt+g3dbvd5fCClW
 eUwNNBapkiKEEHrn1nbws3GMu64iT+r+NL2YPZEpKLodVT/JDnmF95FZgOjTrVu0X0Q8H8HiVgw
 XxqSqjdqyjSw/omLawRgX798/DfzmeUYSDqhtrg0hpamsCzvk/3poexxfXpvwLih1Ijjl3ZUBwF
 taIj3yd2WV6rZsZfxTiinuE+QVIroL6pepw3tkZ3/sQX/11ZoYSZEPrByVr387L/9fkDE9G8Lma
 Wo37CYo1WdDvCW34ozw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_071842_495136_DE86DCB0 
X-CRM114-Status: GOOD (  11.68  )
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


On Thu, 29 Oct 2026 10:18:42 +0800, Baochen Qiang wrote:
> ath12k_peer_assoc_h_eht() copies the peer's EHT PHY capabilities into
> the WMI peer assoc command as is, including the EHT-MCS15 support bits.
> Firmware rate control enables EHT-MCS15 for TX whenever those bits are
> set, without checking whether the local PHY supports MCS15.
> 
> Currently WCN7850 firmware does not support EHT-MCS15 for TX and does
> not advertise it in its own EHT PHY capabilities. When connected to an
> AP that advertises MCS15 support, rate control may still select
> EHT-MCS15, and every PPDU at that rate is aborted by the PHY before it
> goes on the air. TX then stops for minutes while the association stays
> up, and frames sit in the queue until the firmware releases them as aged.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: don't advertise EHT-MCS15 to firmware unless we support it
      commit: 83d689bbe8f90ce39961bcc3a64f2ca2ec184019

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


