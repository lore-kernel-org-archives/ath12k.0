Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC314CA9EC1
	for <ath12k@archiver.kernel.org>; Sat, 10 Oct 2026 14:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=; b=XgwUlX04mmWaw7zoBdn+vnAL2J
	2kNoWxF+gI2AP3AXyTZunmsMwH8TD/WVE8ylYqhfrvF038cIGGNURSyVl40Kb8OwXgZs3O5zibLm/
	UeXgYzjqO9pKXX6WOaa7UDHkKR0UUbupctOQjNd1x2HJA6jzVz/mNG31fg5BUhHfigmy9XsxE3uuq
	uS+1i7SNeSX98fVORBoASoSrKumSinp8j8qUbLWZqqGCE8SBqQFXRrDPckdfD8XmCh1xkAZh4nH5V
	BwatherR6jex6758DIpU3L4fDbwRQsEujFN/pg6jTu0o9dFmyukvJK47+r65TypuqI+kPwogBkb4U
	IBQsKoyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYNV-00000008Bmz-2SYO;
	Sat, 10 Oct 2026 14:48:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFYNS-00000008Blj-1puI
	for ath12k@lists.infradead.org;
	Sat, 10 Oct 2026 14:48:48 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ACUeQA1136832
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 14:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=; b=G3EcykJepng9Rm/4
	IcFivB5I7KHTyU3KxjXTUjPlLY1b8sDkKM5mlTXR+m08mQ/so2fbHdhWOWFp3S9w
	5/2kXjPYsKV9ULweaqMiLTVJBcK4Z13LxGLmwL4vDXAfY8MKc6mJcm7FeoA5YIl4
	bDVG8RZMRYuNZLBfp+E724+JfHKdFLe6d+ElskSaSXNeGO1DOOwFD1l3XeV0qhE6
	+k6c1Y3kIaEYG1TR6+4eKvRPvKt6Brk/1TptuKdJHKjVrB0AgBY1M4OH525FZ6IX
	41VFxWfFrwRMJnuyqP9M+xBwhPLxk4ziS4/J1VcIaFQthmQwJwC5SPXHziKnLcfk
	vGM7Vg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxhage-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 14:48:45 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so1307938eec.1
        for <ath12k@lists.infradead.org>; Sat, 10 Oct 2026 07:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791643724; x=1792248524; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=;
        b=if1SaN/C/YqDpiVqzTSrKt82UvNITLuzN5wOcqx+33rHV2/xEZ/TPC0ESEFTcuhJmZ
         2MA+5h3vWRCEpjzEEedijOPRhULExWCeChtcsQI4O+GJs6K6rJQDgraHZm35Jc6sdVZU
         kBaeedLR/9rPMs8tBxoiaI7I6xxVEtzg8ufURm+Fh5TrToPKDYpZzSGGtIJwsyktgJEe
         7YJvqpp63s9ve+opwuLzY93iF3aMENTmV03tQRsHRp1oud/F+PukYkMqcJEYguMXI9EW
         UDjL86y8f8Z4c7/ASqzTzlVGr6zcqvgImWomZsBr6SxiPueOBNCM9KUT23B3vrw1MW7L
         Lasg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791643724; x=1792248524;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EDoraaW4HZfDPss32Nc2ug8E5EIpFGQ5ypvQ5P+Zx4=;
        b=tstC9ymHV1U5pyZZjS7Tv5YBnSj7JArS7wM+AvKp/6XIW/nCjq7brPfN8DN6vS22CN
         JFZWpQwvJ+22IzNXVHufcP8ypdsMb+sGli5dUmV9pbSAFgg96lL/sYD1XLjiBcvHXwcT
         kXozh1z5sWDAe8JnKsIq+WR1xHnaD0CnxlwQICrVCeEVEHhioTwiFSdtm2VjU9+BRG7T
         rdIoBopBwiFlEM+b+XTONKQa6rMMOr+DEqKCxV0dnQKkCaCSbe7+UVA6ZvYf+UyfvHwm
         tAhQ0NoKK/heRjM781YjRRT2LMDIfRea5GYGUmOi6Z31Mn22VYjHu+S1hyf16FbXQQrP
         nGdw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ/FogOAzuMsmox0Ij5NOJnseMXnULgocwLlO1VnwXHbn6x3IKI0tYyM1nUKNM7y9GXvfWWcU=@lists.infradead.org
X-Gm-Message-State: AFq9FYK/cxs8sYnzxtQNlf1h4miI8JXGBdY7FbiVZgGXcGiry1xQXVTW
	Hx61P/fgI6/3wb90mPgeMak8eu6TqU9gALiwpqGDU06miKS1fKAfK3gSOu6v5J5h55iOIF5ixJC
	1M3GdztoCxKwwfz+Uvs7cW+bncw4yazPnjtkpQ2rHgv+f3soLZfTs8GAqzTrMdKKt7IKNUZDU
X-Gm-Gg: AYBFou3TroWRIpYEpWRv3+Zgx5SYHS+fUCCPQabH7HqMfKfkZsOtAyItyas2Qx4PEJL
	B/6qpULLEG21yYL+BWGkoBRUopt9M2MBtbeaoML7s1NhNXbYj4hQw3AKSN+5LJUjMJcgeJHUN8h
	Xpr/HVzBOQypl8mRo9kxHgZDW0oGlPSOWGbMpbYmrRYdhX9+O0/yXlxv1PtsC+D3iSfsD6ar5FE
	SIb7DHWjm3osPnrK7rzhvv2fRvJ/xKrgmvTLruLwX2QOjBQoDcJ/LZQeQ+Dy9Tgc5b5V54zrUiM
	IvKyS57VOpEtc5L4bOZnboskZZ1SgKnHOULGMtGBVALnXAdfKtjzjwNIt2W22YeML/1HSu2oNxj
	7Lbmdn4FyUng4HyAjDAiD1Rnq13be12eq8dQV4W1DkwzztKzpdhIrZQ==
X-Received: by 2002:a05:7022:b047:10b0:144:ddf7:2570 with SMTP id a92af1059eb24-16a5e8728dbmr6573642c88.39.1791643723976;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
X-Received: by 2002:a05:7022:b047:10b0:144:ddf7:2570 with SMTP id a92af1059eb24-16a5e8728dbmr6573602c88.39.1791643723354;
        Sat, 10 Oct 2026 07:48:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca7133asm19713287eec.14.2026.10.10.07.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:48:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
References: <20260413-hal_rx_reo_queue_info2_msdu_count-v1-1-c4c92ccf77b9@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove unused
 HAL_RX_REO_QUEUE_INFO macros
Message-Id: <179164372257.2359474.11655670441431181998.b4-ty@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 07:48:42 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: tjhVPHCOGNvGS_Rm9Twux_umr11lNkqF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfXypA2VRY+yr1N
 t/91wx+y5Q+D/eEqqRrgoS52dvyYW6aEin3tV/ZZNoHc7SbL32O74+5qLgnchdXSTDCNiF7xjbc
 BZAhCrDtakKmDpkcArf2HvDa6zaNKts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA1OCBTYWx0ZWRfXxnXR03651QI0
 5gMD8xBAzTr0Vm+MgUFjN9H1JN0+0Gb7tErMUkZPB0T7m5Zd7gOVwOu52e365CcdJm3WH9Bkhpn
 ht9NUml5bAh6NBgAG26n4GWdjSgbOz4CxunjZvyz++2twOk0rfmxg/znBtwarkaLag15TMM4zXc
 pU1S2OWccGOFoylDDaWJ8eQ7dNPFHLFiVrXJoTnITqiL60gm1eXPD95yhgHnNJxwcdO4PgIk4e6
 FdDx2LmTQ3mS6xqm9y/W6cl9VmATBiaeF7gLM/1vigmnFS4VM7SMQCervn6b/U3vY1tf46tqKWe
 uur7XdTMQOta9JV/ZFKjzImsJkAO+wUTCNinqyrnYoxCTEIxqZe3hjnO7I/JVlMb4efERp7/zNi
 /hBUCit9QsV0vI9dOy11Rf0IETc0mHyTJ1fnQqH7yjvdx3+JdSjwjt8Nb1Pa6Afrrx8HFPb+QSu
 S6TgORJDK/oLzn7lFvA==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6aca504d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2ChmhLmt-ZLakbd1MbYA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: tjhVPHCOGNvGS_Rm9Twux_umr11lNkqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_074846_966107_7B0ECB3B 
X-CRM114-Status: UNSURE (   7.28  )
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


On Mon, 13 Apr 2026 16:58:46 -0700, Jeff Johnson wrote:
> Many of the HAL_RX_REO_QUEUE_INFO macros are unused, so remove them.
> 
> No functional change. Compile Tested only.
> 
> 

Applied, thanks!

[1/1] wifi: ath12k: Remove unused HAL_RX_REO_QUEUE_INFO macros
      commit: d26b64fbb844fa00d9c95b7e1ae7fa8f546952db

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


